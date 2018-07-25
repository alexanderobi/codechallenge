module Lib
    ( runParings
    ) where

import Data.List

data Student = Annie |  Oskar | Olle | Ingrid | Yuchen | Arjun | Esmeralda deriving (Show, Eq, Ord)
data Tutor = Joakim | Bob | Frieda | Kseniya | Maggie | Jamal deriving (Show, Eq, Ord)
data Subject = Reading | Writing | Essay | Science | Math | History | Chemistry deriving (Show, Eq, Ord)
data Subjects = ACT Subject | US Subject | AP Subject deriving (Show, Eq, Ord)

type TutorEligibilities = (Tutor, [Subjects])
type StudentPreferences = (Student, [Subjects])

optimalParing :: TutorEligibilities -> StudentPreferences -> Maybe (Student, Tutor)
optimalParing t s = do
    let ts = snd t
    let ss = snd s
    case isInfixOf ss ts of
        True -> Just ( fst s, fst t)
        False -> Nothing

runParings :: [TutorEligibilities] -> [StudentPreferences] -> [Maybe (Student, Tutor)]
runParings t s = do
    ss <- s
    ts <- t
    return (optimalParing ts ss)
