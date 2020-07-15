import Data.List

triples : Integer -> List (Integer, Integer, Integer)
triples top = [(x, y, z) | z <- [1..top], y <- [1..z], x <- [1..y],
                           x * x + y * y == z * z]

main : IO ()
main = printLn (length $ triples 1000)
