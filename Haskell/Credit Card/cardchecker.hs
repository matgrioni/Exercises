module Main where

-- Returns a list of the digits of n in their appropriate order.
digits :: Integer -> [Integer]
digits n
    | n < 0     = []
    | n < 10    = [n]
    | otherwise = digits (n `div` 10) ++ [n `mod` 10]

-- Doubles every Integer in a list starting with the first.
-- If there are less than 2 elements in a list it returns the
-- passed in list
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther []       = []
doubleEveryOther (x:[])   = [x]
doubleEveryOther (x:y:zs) = [2 * x, y] ++ doubleEveryOther zs

-- Sums all the digits of all entries in the provided list
sumDigits :: [Integer] -> Integer
sumDigits []     = 0
sumDigits (n:ns) = sum (digits n) + sumDigits(ns)

-- Determines if the provided integer is a valid credit card num
luhn :: Integer -> Bool
luhn n = sumDigits (doubleEveryOther (digits n)) `mod` 10 == 0

main = do
    print(luhn 1234567898765432)
