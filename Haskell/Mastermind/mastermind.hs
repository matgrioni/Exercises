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

-- Counts the number of occurences of an element in a list. Define the
-- case for no list since this last has no type technically and I'm not
-- really sure how the type system reacts.
count :: Eq a => [a] -> a -> Int
count [] _ = 0
count xs x = length (filter (\a -> a == x) xs)

-- Returns the amount of exact matches between the actual code and the guess
-- The first code is the actual code and the second one is the guess.
exactMatches :: Code -> Code -> Int
exactMatches actual guess = length (filter (\(a, b) -> a == b) zipped)
    where zipped = zip actual guess

-- Returns a list parallel to the colors list with the counts for the color
-- corresponding to the number position.
countColors :: Code -> [Int]
countColors code = map (count code) colors

-- The amount of total shared colors between both codes. Would be inexact
-- plus exact matches.
matches :: Code -> Code -> Int
matches c1 c2 = sum [min a b | (a, b) <- zipped]
    where zipped = zip (countColors c1) (countColors c2)

-- Returns a Move given the first code as the actual and the second as the
-- guess. A Move consists of a guess, the number of exact matches, the number
-- of inexact matches.
getMove :: Code -> Code -> Move
getMove actual guess = Move guess exact inexact
    where exact = exactMatches actual guess
          inexact = (-) (matches actual guess) exact

main = do
    print "Hello, World"
