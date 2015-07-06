module Main where

reverse' :: [a] -> [a]
reverse' (x:[]) = [x]
reverse' (x:xs) = reverse' xs ++ [x]

main = do
    putStrLn "Reverses a given list"
    putStrLn "List is 'A man, a plan, a canal, panama!'"
    print $ reverse' "A man, a plan, a canal, panama!"
