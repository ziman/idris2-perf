import Data.List

triples : Int -> List (Int, Int, Int)
triples top = [(x, y, z) | z <- [1..top], y <- [1..z], x <- [1..y],
                           x * x + y * y == z * z]

main : IO ()
main = printLn (length $ triples 1000)
