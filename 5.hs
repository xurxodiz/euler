import Data.List

-- for reference, this is much more succint
-- <I didn't know this function existed>

-- main = putStrLn . show . foldr (lcm) 1 $ [1..20]

-- what follows is the lengthy code I came up with to make up for it:

main :: IO ()
main = putStrLn . show . product . foldl1 (merge) $ [factors a | a <- [1..20]]

        
merge :: [Int] -> [Int] -> [Int]
merge [] x = x
merge x [] = x
merge x (h:t) = (h:) (merge (delete h x) t)

factors :: Int -> [Int]
factors a = factor_aux a [2..sq]
    where sq = floor . sqrt . fromIntegral $ a

factor_aux :: Int -> [Int] -> [Int]
factor_aux a [] = [a]
factor_aux a (h:t) = if a `mod` h == 0 then h:(factors $ quot a h)
                     else factor_aux a t