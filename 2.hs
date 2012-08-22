main :: IO ()
main = putStrLn . show . sum . filter (even) . takeWhile (< 4000000) $ fib
     
fib :: [Int]
fib = 0 : 1 : zipWith (+) fib (tail fib)