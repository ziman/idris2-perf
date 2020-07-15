import Data.List

data Nondet : Type -> Type where
     (>>=) : Nondet a -> (a -> Nondet b) -> Nondet b
     Choose : List a -> Nondet a
     Pure : a -> Nondet a
     Guard : Bool -> Nondet ()

triplesG : Integer -> Nondet (Integer, Integer, Integer)
triplesG top
    = do z <- Choose [1..top]
         y <- Choose [1..z]
         x <- Choose [1..y]
         Guard (x * x + y * y == z * z)
         Pure (x, y, z)

run : Nondet a -> List a
run (x >>= f) = concatMap (run . f) (run x)
run (Choose xs) = xs
run (Pure x) = [x]
run (Guard x) = if x then [()] else []

main : IO ()
main = printLn (length $ run $ triplesG 1000)
