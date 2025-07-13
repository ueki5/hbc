module Lib
    ( someFunc
    ) where

someFunc :: [Integer] -> Integer -> [Integer]
someFunc [] n = [n]
someFunc ns n = n: ns
