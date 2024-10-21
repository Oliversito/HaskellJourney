{-
Defina una función que tome un valor y lo multiplique por 3
-}
multTres :: Int -> Int
multTres x = x * 3

{-
Defina una función que calcule el área de un circulo
-}
areaCirc :: Double -> Double
areaCirc r = pi * r^2

{-
Defina una función que calcule el volumen de un cilindro mediante la composición de la función anterior
con la altura del cilindro
-}
volCil :: Double -> Double -> Double
volCil r h = areaCirc r * h

{-
Defina una función que tome la altura y el radio de un cilindro y compruebe si el volumen es mayor o
igual que 42
-}
compVol :: Double -> Double -> Bool
compVol r h = volCil r h > 42
