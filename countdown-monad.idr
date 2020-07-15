import Control.Monad.State

countdown : State Int ()
countdown
    = do x <- get
         if x == 0
            then pure ()
            else do put (x - 1)
                    countdown

main : IO ()
main = printLn (runState countdown 500000000)
