module Main where

main :: IO ()
main = interact $ displayFuel . fuelForModules . parseModules

type Module = Int

parseModules :: String -> [Module]
parseModules = map read . lines

fuelForModules :: [Module] -> Int
fuelForModules = sum . map fuelForModule

fuelForMass :: Module -> Int
fuelForMass mass = max 0 $ (mass `div` 3) - 2

fuelForModule :: Module -> Int
fuelForModule 0 = 0
fuelForModule mass = fuelMass + fuelForModule fuelMass
    where
        fuelMass = fuelForMass mass
  
displayFuel :: Int -> String
displayFuel = show
