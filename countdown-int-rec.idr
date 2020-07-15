countdown : Int -> Int
countdown 0 = 0
countdown n = countdown (n-1)

main : IO ()
main = printLn (countdown 50000000)
