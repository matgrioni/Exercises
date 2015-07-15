{-
 - Author: Matias Grioni
 - Created: 7/15/15
 -
 - Duplicates each element in a list.
 -}

module Main where

dup :: [a] -> [a]
dup [] = []
dup (x:xs) = x:x:dup(xs)

main = do
    putStrLn "Duplicates each element in a list"
    putStrLn "List is [a, b, c, c, d]"
    print $ dup ['a', 'b', 'c', 'c', 'd']
