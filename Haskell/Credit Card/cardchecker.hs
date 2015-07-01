module Main where

luhn :: Integer -> Bool
luhn n = False

-- Returns a list of the digits of n in their appropriate order.
digits :: Integer -> [Integer]
digits n
    | n < 0     = []
    | n < 10    = [n]
    | otherwise = digits (n `div` 10) ++ [n `mod` 10]

-- Doubles every Integer in a list starting with the second.
-- If there are less than 2 elements in a list it returns the
-- passed in list
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther []       = []
doubleEveryOther (x:[])   = [x]
doubleEveryOther (x:y:zs) = [x, 2 * y] ++ doubleEveryOther(zs)

main = do
    print(doubleEveryOther (digits 1234))
