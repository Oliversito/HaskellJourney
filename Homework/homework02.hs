{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use :" #-}

{-
P1. Añada la firma de tipo para las siguientes funciones.
-}

f1:: Double -> Double -> Double -> Double
f1 x y z = x ** (y/z)

f2 :: Double -> Double -> Double -> Double
f2 x y z = sqrt (x/y - z)

f3 :: Bool -> Bool -> [Bool]
f3 x y = [x == True] ++ [y]

f4 :: String -> String -> String -> Bool
f4 x y z = x == (y ++ z)

{-
P2. ¿Por qué debemos definir los tipos de las funciones?

R. Porque se evitan errores, el código es más claro para otras personas y da claridad sobre la intención que se tiene al escribir
cada función.
-}

{-
P3. ¿Por qué debemos definir los tipos de las variables?

R. Porque se evitan errores, el código es más claro para otras personas y da claridad sobre cómo usar variables en funciones que
hagan parte del código.
-}

{-
P4. ¿Hay alguna función en Haskell que permita hacer transformaciones entre tipos?

R. Sí. La función "convertible" es una clase de tipo que tiene una única función que permite hacer conversiones entre diferentes
tipos.
-}

{-
P5. ¿Hay listas de listas en Haskell? ¿Se mencionó algún ejemplo? ¿Cómo acceder al elemento más adentro?

R. Sí, en Haskell hay listas de listas, es decir, listas con la siguiente forma: [[], [], []]. En el curso se vió que un tipo de 
dato String es una lista de datos Char, por lo tanto, los tipos de datos de la forma [String] son listas de listas y en el curso
sí se vieron ejemplos de esto. La forma en la que se podría acceder al elemento más adentro de una lista de listas es por medio de
recursión.
-}