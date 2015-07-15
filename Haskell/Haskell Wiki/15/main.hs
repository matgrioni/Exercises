{-
 - Author: Matias Grioni
 - Created: 7/15/15
 -
 - Replicates element in a given list an arbitary number of times.
 -}

module Main where

mult :: Int -> a -> [a]
mult 1 a = [a]
mult n a = a:(mult (n-1) a)

rep :: [a] -> Int -> [a]
rep xs n = foldl (++) [] $ map (mult n) xs

main = do
    putStrLn "Replicates elements in a given list an arbitrary number of times"
    putStrLn "List is ('a', 'b', 'c') 3 times"
    print $ rep [1..10] 3

