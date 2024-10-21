{-
En este documento hablaremos de las clases de tipo de Haskell
-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use newtype instead of data" #-}

{-
En Haskell, cada término debe tener un tipo. En algunos casos pareciera que hay términos
con más de un tipo, a estos términos los llamamos polimórficos. La función identidad es
un ejemplo de esto ya que si x es 32 o "Juan Carlos" la función compila y retorna 32 o
"Juan Carlos" en alguno de los casos.
-}
myid :: a -> a
myid x = x

{-
No todos los términos polimórficos son fáciles de entender, por ejemplo (==) ¿qué tipo de
dato es? La respuesta no es clara, podemos usar el operador (==) de las siguientes formas:

    1. 3 == 2 -> False
    2. "love" == "love" -> True

Podríamos entonces suponer que el tipo de dato del operador en cuestipon es:

    (==) :: a -> a -> -> Bool

Pero esto no es cierto, hay algunos tipos que no soportan la noción de igualdad (por ejemplo
los tipos funciones).

Esto nos lleva a una forma de polimorfismo llamada ad hoc polymorphism. En Haskell el ad hoc
polymorphism se maneja por medio de las clases de tipo (type clases)
-}

{-
La función (==) es ad hoc polomórfica y su tipo es

    (==) :: Eq a => a -> a -> Bool

En la expresión anterior Eq es la clase de tipo y la restricción de tipo Eq a => indica que en
la siguiente expresión de tipo, la variable de tipo a puede tomar los valors que sean instancias
de la clase de tipo Eq.

    class ClassName typeVariable where
    methods :: MethodTypes

    defaultDefinitions

Ejemplo:

    class Eq a where
    (==), (/=) :: a -> a -> Bool

    x /= y = not (x == y)
    x == y = not (x /= y)
-}

