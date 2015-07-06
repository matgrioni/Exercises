module Main where

-- Returns the element of a list at a specified position
elementat :: [a] -> Int -> a
elementat [] _ = error "Needs at least one element"
elementat xs 0 = head xs
elementat (x:xs) i = elementat (xs) $ i-1

main = do
    putStrLn "Finds the kth element of a list"
    putStrLn "2@[1..10]"
    print $ elementat [1..10] 2
