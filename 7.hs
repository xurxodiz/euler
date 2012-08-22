import Data.List

main :: IO ()
--main = putStrLn . show $ take 10001 primes
main = putStrLn . show . head . flip (drop) (primes) $ 10000

primes :: [Int]
primes = filter (isPrime) generator

generator :: [Int]
generator = (2::Int):(3::Int) : (concat [[6*k-1, 6*k+1] | k <- [1..]])

isPrime :: Int -> Bool
isPrime x = (not . even $ x) && (length (factors x) == 2)

factors :: Int -> [Int]
factors a = factor_aux a [2..sq]
    where sq = floor . sqrt . fromIntegral $ a

factor_aux :: Int -> [Int] -> [Int]
factor_aux a [] = [a,1]
factor_aux a (h:t) = if a `mod` h == 0 then h:(factors $ quot a h)
                     else factor_aux a t
