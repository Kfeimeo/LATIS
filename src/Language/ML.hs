{-# LANGUAGE GADTs #-}
module Language.ML where
import Language.Types
import Data.List (sortOn)
import Control.Monad (foldM)

-- Typed, pure higher-order embedding. Function evaluation propagates errors.
-- There is no recursion constructor. iterateWhile always consumes explicit fuel.
data Expr a where
  Value :: Ty a -> a -> Expr a
  Lambda :: Ty a -> (a -> Expr b) -> Expr (Fn a b)
  Application :: Expr (Fn a b) -> Expr a -> Expr b
  Composition :: Expr (Fn b c) -> Expr (Fn a b) -> Expr (Fn a c)
  Map :: Expr (Fn a b) -> Expr [a] -> Expr [b]
  Filter :: Expr (Fn a Bool) -> Expr [a] -> Expr [a]
  SortBy :: Expr (Fn a Int) -> Expr [a] -> Expr [a]
  Scan :: Expr (Fn (a,b) a) -> Expr a -> Expr [b] -> Expr [a]
  Fold :: Expr (Fn (a,b) a) -> Expr a -> Expr [b] -> Expr a
  If :: Expr Bool -> Expr a -> Expr a -> Expr a
  Add :: Expr Int -> Expr Int -> Expr Int
  Subtract :: Expr Int -> Expr Int -> Expr Int
  Multiply :: Expr Int -> Expr Int -> Expr Int
  -- Stage A: integer remainder with Haskell `mod` semantics (the result takes
  -- the sign of the divisor: (-3) `mod` 2 == 1, 3 `mod` (-2) == -1); a zero
  -- divisor is an explicit evaluation failure, never 0.
  Mod :: Expr Int -> Expr Int -> Expr Int
  -- Stage A: parity test; negative odd integers are odd ((-3) -> True).
  IsOdd :: Expr Int -> Expr Bool
  Less :: Expr Int -> Expr Int -> Expr Bool
  EqualInt :: Expr Int -> Expr Int -> Expr Bool
  Not :: Expr Bool -> Expr Bool
  -- Stage B: Boolean connectives. Both arguments are evaluated (no short
  -- circuit): an evaluation failure in either argument is a failure of the
  -- connective, so And(False, Mod(x,0)) fails instead of returning False.
  And :: Expr Bool -> Expr Bool -> Expr Bool
  Or :: Expr Bool -> Expr Bool -> Expr Bool
  Tuple :: Expr a -> Expr b -> Expr (a,b)
  First :: Expr (a,b) -> Expr a
  Second :: Expr (a,b) -> Expr b
  List :: [Expr a] -> Expr [a]
  Head :: Expr [a] -> Expr a
  Tail :: Expr [a] -> Expr [a]
  Index :: Expr [a] -> Expr Int -> Expr a
  Length :: Expr [a] -> Expr Int
  ArgMin :: Expr (Fn a Int) -> Expr [a] -> Expr a
  ArgMax :: Expr (Fn a Int) -> Expr [a] -> Expr a
  IterateWhile :: Expr Int -> Expr (Fn a Bool) -> Expr (Fn a a) -> Expr a -> Expr a

eval :: Expr a -> Either String a
eval (Value _ a) = Right a
eval (Lambda _ body) = Right (Fn (eval . body))
eval (Application f x) = do Fn g <- eval f; eval x >>= g
eval (Composition f g) = do Fn h <- eval f; Fn k <- eval g; pure (Fn (\x -> k x >>= h))
eval (Map f xs) = do Fn g <- eval f; eval xs >>= traverse g
eval (Filter f xs) = do Fn g <- eval f; as <- eval xs; flags <- traverse g as; pure [a | (a,True) <- zip as flags]
eval (SortBy f xs) = do Fn g <- eval f; as <- eval xs; keys <- traverse g as; pure (map snd (sortOn fst (zip keys as)))
eval (Scan f initial xs) = do
  Fn step <- eval f; seed <- eval initial; as <- eval xs
  let go a [] = Right [a]
      go a (b:bs) = do next <- step (a,b); rest <- go next bs; pure (a:rest)
  go seed as
eval (Fold f initial xs) = do Fn step <- eval f; seed <- eval initial; as <- eval xs; foldM (\a b -> step (a,b)) seed as
eval (If p a b) = do yes <- eval p; if yes then eval a else eval b
eval (Add a b) = (+) <$> eval a <*> eval b
eval (Subtract a b) = (-) <$> eval a <*> eval b
eval (Multiply a b) = (*) <$> eval a <*> eval b
eval (Mod a b) = do
  x <- eval a; y <- eval b
  if y == 0 then Left "mod: division by zero" else Right (x `mod` y)
eval (IsOdd a) = odd <$> eval a
eval (Less a b) = (<) <$> eval a <*> eval b
eval (EqualInt a b) = (==) <$> eval a <*> eval b
eval (Not a) = not <$> eval a
eval (And a b) = (&&) <$> eval a <*> eval b
eval (Or a b) = (||) <$> eval a <*> eval b
eval (Tuple a b) = (,) <$> eval a <*> eval b
eval (First a) = fst <$> eval a
eval (Second a) = snd <$> eval a
eval (List as) = traverse eval as
eval (Head xs) = do as <- eval xs; case as of [] -> Left "head: empty list"; a:_ -> Right a
eval (Tail xs) = do as <- eval xs; case as of [] -> Left "tail: empty list"; _:rest -> Right rest
eval (Index xs n) = do as <- eval xs; i <- eval n; if i < 0 || i >= length as then Left "index: out of range" else Right (as !! i)
eval (Length xs) = length <$> eval xs
eval (ArgMin f xs) = eval (Head (SortBy f xs))
eval (ArgMax f xs) = do
  Fn g <- eval f; as <- eval xs; keys <- traverse g as
  case sortOn (negate . fst) (zip keys as) of
    [] -> Left "argmax: empty list"
    (_,a):_ -> Right a
eval (IterateWhile fuel predicate step state) = do
  n <- eval fuel
  if n < 0 then Left "iterateWhile: negative fuel" else do
    Fn p <- eval predicate; Fn f <- eval step; s <- eval state
    let go 0 a = Right a
        go k a = do yes <- p a; if yes then f a >>= go (k-1) else Right a
    go n s
