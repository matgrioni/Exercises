{-
 - Author: Matias Grioni
 - Created: 7/14/15
 -
 - Eliminates consecutive duplicates of list elements.
 -}

module Main where

compress :: (Eq a) => [a] -> [a]
compress (x:y:zs)
    | x == y = compress (x:zs)
    | otherwise = x:compress (y:zs)
compress (x:[]) = [x]
compress [] = []

main = do
    putStrLn "Eliminates consevutive duplicates of list elements"
    putStrLn "List is 'aaaabccaadeeee"
    print $ compress "aaaabccaadeeee"
