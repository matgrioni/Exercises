module Main where

-- Data type definitions
-- Peg has 6 possible color options
data Peg = Red | Green | Blue | Yellow | Orange | Purple
    deriving (Show, Eq, Ord)

-- A code is a list of pegs
type Code = [Peg]

-- A move is created by a code and the number of exact matches
-- and the number of inexact matches
data Move = Move Code Int Int

-- List of all the possible colors
colors :: [Peg]
colors = [Red, Green, Blue, Yellow, Orange, Purple]

-- Returns the amount of exact matches between the actual code and the guess
-- The first code is the actual code and the second one is the guess.
exactMatches :: Code -> Code -> Int
exactMatches actual guess = length (filter (\(a, b) -> a == b) zipped)
    where zipped = zip actual guess

main = do
    print (exactMatches [Red, Red] [Blue, Red])
