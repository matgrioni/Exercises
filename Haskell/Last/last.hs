module Main where

-- Returns the last element of a passed in list
last' :: [a] -> a
last' (x:[]) = x
last' (x:xs) = last xs

main = do
    putStrLn "Program finds last element of an internal list"
    putStrLn "List is [1..1000]"
    print $ last' [1..1000]
