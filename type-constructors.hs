{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use newtype instead of data" #-}

--En Haskell podemos definir tipos de datos de la siguiente forma:
data TypeConstructor = DataConstructors

-- Estos son algunos ejemplos de tipos de datos:
data Bool = True | False
data WithString a = WithString a String

{-
En los ejemplos anteriores Bool y WithString son los constructores de tipo ya que son estos
los que construyen nuevos tipos de datos. También existen las variables de tipo (en el
ejemplo anterior 'a' es una variable de tipo) que deben ser entregadas al constructor
(en este caso WithString) para que este pueda construir un nuevo tipo.

Si a = Int entonces obtenemos el tipo WithString Int que es un tipo de dato cuyos elementos
son strings con números enteros.
-}

{-
Una vez tenemos un constructor de tipo de dato, queremos generar términos o datos a partir
de este constructor. Para ellos se debe usar un constructor de datos que es usualmente una 
función: 
        
        MakeWithString :: a -> String -> WithString a
-}

{-
El siguiente código es un ejemplo de cómo construir un functor identidad:
-}
data Identity a = MkId a
x:: Identity String
x = MkId "Hi!"

mapId :: (a -> b) -> Identity a -> Identity b
mapId f (MkId z) = MkId (f z)

{-
Es posible general las construccines de los functores haciendo uso de las TypeClasess. El siguiente es un
ejemplo
-}
instance Functor Identity where
    fmap f (MkId a) = MkId (f a)

{-
Otro ejemplo es el functor maybe que puede construirse de la siguiente forma:
(Este functor ya está definido en la librería base de Haskell y no puede duplicarse,
por eso en este ejemplo usé el prefijo My antes de las palabras reservadas usuales)
Un ejemplo clásico es el functor Maybe que podemos hacerlo de la siguiente forma:
-}
data MyMaybe a = MyNothing | MyJust a
instance Functor MyMaybe where
    fmap g MyNothing = MyNothing
    fmap g (MyJust a) = MyJust (g a)