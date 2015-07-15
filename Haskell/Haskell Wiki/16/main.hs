{-
 - Author: Matias Grioni
 - Created: 7/15/15
 -
 - Drops every n'th element from a given list.
 -}

module Main where

drop' :: [a] -> Int -> [a]
drop' xs n = map fst . filter (\(x, i) -> i `mod` n /= 0) . zip xs $ [1..]

main = do
    putStrLn "Drops every n'th element from a given list"
    putStrLn "'abcdefghik' 3"
    print $ drop' "abcdefghik" 3
