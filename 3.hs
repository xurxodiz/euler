import Data.List

main :: IO ()
main = putStrLn . show . head . reverse . sort . factors $ 600851475143

factors :: Int -> [Int]
factors a = factor_aux a [2..sq]
    where sq = floor . sqrt . fromIntegral $ a

factor_aux :: Int -> [Int] -> [Int]
factor_aux a [] = [a]
factor_aux a (h:t) = if a `mod` h == 0 then h:(factors $ quot a h)
                     else factor_aux a t
    
