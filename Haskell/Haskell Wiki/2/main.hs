module Main where

penultimate :: [a] -> a
penultimate [] = error "List needs at least 2 elements"
penultimate (x:[]) = error "List needs at least 2 elements"
penultimate (x:y:[]) = x
penultimate (x:y:zs) = penultimate (y:zs)

main = do
    putStrLn "Finds the penultimate element of an internal list"
    putStrLn "List is ['a'..'z']"
    print $ penultimate ['a'..'z']
