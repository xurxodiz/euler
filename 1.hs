main :: IO ()
main = putStrLn . show . sum . filter (fx) $ [1..999]

     where fx x = (x `mod` 3) == 0 || (x `mod` 5) == 0