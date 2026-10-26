module ARC.Dataset (Task(..), TestPair(..), loadTask, parseTask, jsonGrid, JSON(..), parseJSONText, field, asArray, asInt) where
import Latent.Grid
import Synthesis.Verify (TrainingPair)
import Text.ParserCombinators.ReadP
import Data.Char (isSpace, isDigit)
import Data.List (intercalate)

-- A small strict JSON reader avoids package installation. It rejects malformed
-- JSON/trailing content and validates ARC shapes/colors with mkGrid.
data JSON = JObject [(String,JSON)] | JArray [JSON] | JString String | JInt Int | JNull | JBool Bool
  deriving (Eq,Show)
data TestPair = TestPair { testInput :: Grid, testOutput :: Maybe Grid } deriving (Eq,Show)
data Task = Task { taskId :: String, training :: [TrainingPair], tests :: [TestPair] } deriving (Eq,Show)

lexeme :: ReadP a -> ReadP a
lexeme p = skipSpaces *> p <* skipSpaces
symbol :: Char -> ReadP Char
symbol = lexeme . char
jstring :: ReadP String
jstring = char '"' *> many character <* char '"'
  where character = satisfy (\c -> c /= '"' && c /= '\\' && fromEnum c >= 32) <++ (char '\\' *> escaped)
        escaped = choice [char a *> pure b | (a,b) <- [('"','"'),('\\','\\'),('/','/'),('b','\b'),('f','\f'),('n','\n'),('r','\r'),('t','\t')]]
jvalue :: ReadP JSON
jvalue = lexeme (object <++ array <++ (JString <$> jstring) <++ number <++ literal)
  where
    object = JObject <$> between (symbol '{') (symbol '}') (sepBy member (symbol ','))
    member = do key <- lexeme jstring; _ <- symbol ':'; val <- jvalue; pure (key,val)
    array = JArray <$> between (symbol '[') (symbol ']') (sepBy jvalue (symbol ','))
    number = do sign <- option "" (string "-"); digits <- string "0" <++ ((:) <$> satisfy (\c -> c >= '1' && c <= '9') <*> munch isDigit); pure (JInt (read (sign++digits)))
    literal = (string "null" *> pure JNull) <++ (string "true" *> pure (JBool True)) <++ (string "false" *> pure (JBool False))
field :: String -> JSON -> Either String JSON
field name (JObject fields) = maybe (Left ("Missing key: "++name)) Right (lookup name fields)
field _ _ = Left "Expected JSON object"
asArray :: JSON -> Either String [JSON]
asArray (JArray a) = Right a
asArray _ = Left "Expected JSON array"
asInt :: JSON -> Either String Int
asInt (JInt n) = Right n
asInt _ = Left "Expected JSON integer"
asGrid :: JSON -> Either String Grid
asGrid j = asArray j >>= traverse (\r -> asArray r >>= traverse asInt) >>= mkGrid
parseTask :: String -> String -> Either String Task
parseTask name source = do
  root <- case [j | (j,rest) <- readP_to_S (skipSpaces *> jvalue <* eof) source, all isSpace rest] of
    [j] -> Right j
    _ -> Left "Invalid/ambiguous JSON"
  trainItems <- field "train" root >>= asArray
  if null trainItems then Left "Task must have training pairs" else do
    ts <- traverse (\j -> (,) <$> (field "input" j >>= asGrid) <*> (field "output" j >>= asGrid)) trainItems
    testItems <- field "test" root >>= asArray
    qs <- traverse parseTest testItems
    pure (Task name ts qs)
  where parseTest j = do
          input <- field "input" j >>= asGrid
          output <- case j of
            JObject fields -> case lookup "output" fields of Nothing -> Right Nothing; Just o -> Just <$> asGrid o
            _ -> Left "Test item must be object"
          pure (TestPair input output)
-- The same strict reader for other JSON inputs (trace replay requests).
parseJSONText :: String -> Either String JSON
parseJSONText source=case [j | (j,rest) <- readP_to_S (skipSpaces *> jvalue <* eof) source, all isSpace rest] of
  [j] -> Right j
  _ -> Left "Invalid/ambiguous JSON"
loadTask :: FilePath -> IO (Either String Task)
loadTask path = parseTask path <$> readFile path
jsonGrid :: Grid -> String
jsonGrid g = "[" ++ intercalate "," ["[" ++ intercalate "," (map show r) ++ "]" | r <- rows g] ++ "]"
