data StateI : Type -> Type -> Type where
     Get : StateI st st
     Put : st -> StateI st ()
     Pure : a -> StateI st a
     (>>=) : StateI st a -> (a -> StateI st b) -> StateI st b

runStateI : StateI st a -> st -> (a, st)
runStateI Get s = (s, s)
runStateI (Put x) s = ((), x)
runStateI (Pure x) s = (x, s)
runStateI (prog >>= k) s
    = let (p', s') = runStateI prog s in runStateI (k p') s'

countdownI : StateI Int ()
countdownI
    = do x <- Get
         if x == 0
            then Pure ()
            else do Put (x - 1)
                    countdownI

main : IO ()
main = printLn (runStateI countdown 500000000)
