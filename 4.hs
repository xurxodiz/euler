import Data.List

main :: IO ()
main = putStrLn . show . maximum . filter (isPalindrome) $ products

products :: [Int]
products = [x*y | x <- [100..999], y <- [100..999]]

isPalindrome :: Int -> Bool
isPalindrome p = str == reverse str where str = show p
