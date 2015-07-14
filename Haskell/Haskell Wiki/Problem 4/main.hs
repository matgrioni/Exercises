module Main where

length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

main = do
    putStrLn "Finds number of elements in list"
    putStrLn "Length of [1..150]"
    print $ length' [1..150]
