module Lib
    ( someFunc
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

runParings :: [TutorEligibilities] -> [StudentPreferences] -> [(Student, Tutor)]
runParings t s = undefined

someFunc :: IO ()
someFunc = putStrLn "someFunc"

-- tutorEligibilities :: Tutor -> [Subjects]
-- tutorEligibilities Joakim = [ACT Reading, ACT Essay, ACT Writing]
-- tutorEligibilities Bob = [AP Chemistry, ACT Science]
-- tutorEligibilities Frieda = [ACT Essay, ACT Writing]
-- tutorEligibilities Kseniya = [US History]
-- tutorEligibilities Maggie = [ACT Science]
-- tutorEligibilities Jamal = [ACT Math]

-- studentPreferences :: Student -> [Subjects]
-- studentPreferences Annie = [ACT Math]
-- studentPreferences Oskar = [AP Chemistry]
-- studentPreferences Olle = [ACT Reading, ACT Writing, ACT Essay, ACT Science, ACT Math]
-- studentPreferences Ingrid = [US History, AP Chemistry]
-- studentPreferences Yuchen = [ACT Math]
-- studentPreferences Arjun = [ACT Reading, ACT Writing, ACT Essay]
-- studentPreferences Esmeralda = [AP Chemistry]

