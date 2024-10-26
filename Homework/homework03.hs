{-
Costruya una función que revise si el consumo de energía de un dispositivo electrónico es mayor,
menor o igual al permitido.
-}

{-
Use la función 'show :: a -> String' para transformar cualquier tipo en un String. En la función
anterior devuelva el exceso o ahorro de consumo.
-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use guards" #-}

checkEnrg :: Double -> Double -> Double -> String
checkEnrg c h m
        | use > m = "Uses more than the allowed quantity" ++ " " ++ show (use - m)
        | use < m = "Uses less than the allowed quantity" ++ " " ++ show (use - m)
        | otherwise = "Uses exactly the allowed quantity" ++ " " ++ show (use - m)
    where 
        use = c * h * 30

{-
Escriba una función que muestre las ventajas de usar las expresiones let.
-}

areaCirEsf :: String -> Double -> Double
areaCirEsf x r =
    let aCir = pi * r^2
        aEsf = 4 * pi * r^2
    in if x == "Esfera" then aEsf else if x == "Circulo" then aCir else 0


{-
Escriba una función que muestre el cociente de dos números. Dicho cociente no debe ser mayor a uno. Si alguno de los
números es cero entregue un mensaje que diga que la división no es posible. Escriba el código usando el condicional
if y los guards.
-}
cociNoUno :: Double -> Double -> String
cociNoUno x y =
    if x == 0 || y == 0
        then "The division is not posible"
        else if x > y
            then show (y / x)
            else if y > x
                then show (x / y)
                else show 1

cociNoUno' :: Double -> Double -> String
cociNoUno' x y
    | x == 0 || y == 0 = "The division is not posible"
    | x > y = show (y / x)
    | y > x = show (x / y)
    |otherwise = show 1

{-
Escriba una función que tome dos números y calcule la suma de las raices cuadradas de los productos y cocientes de los
dos números. Escriba la función de tal forma que use un bloque let dentro de un where y un where dentro de un let.
-}

dosNum :: Double -> Double -> Double
dosNum x y =
    let 
        prod = x * y
        div = x / y
    in sqrt (prod + div) 
    