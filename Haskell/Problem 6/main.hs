module Main where

palindrome :: (Eq a) => [a] -> Bool
palindrome xs = reverse xs == xs

main = do
    putStrLn "Checks if a list is a palindrome"
    putStrLn "List is 'racecar'"
    print $ palindrome "racecar"
