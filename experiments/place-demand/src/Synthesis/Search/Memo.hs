module Synthesis.Search.Memo where
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.Word (Word64)
import Data.Bits (xor)
import Data.Char (ord)

-- Keep complete canonical keys in hash buckets: collisions never prune states.
data Memo = Memo
  { expressionCache :: M.Map String [String]
  , partialCache :: M.Map Word64 (S.Set String)
  , programCache :: M.Map String Bool
  } deriving (Eq,Show)
emptyMemo :: Memo
emptyMemo = Memo M.empty M.empty M.empty
stateHash :: String -> Word64
stateHash = foldl' (\h c -> (h `xor` fromIntegral (ord c))*1099511628211) 14695981039346656037
seenPartial :: String -> Memo -> Bool
seenPartial key memo = maybe False (S.member key) (M.lookup (stateHash key) (partialCache memo))
rememberPartial :: String -> Memo -> Memo
rememberPartial key memo = memo {partialCache=M.insertWith S.union (stateHash key) (S.singleton key) (partialCache memo)}
