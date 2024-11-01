{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use guards" #-}

{-
Imagine we have the following function
-}
specialBirthday :: Int -> [Char]
specialBirthday age =
  if age == 1
    then "First birthday!"
    else
      if age == 18
        then "You're an adult!"
        else
          if age == 60
            then "Finally, I can stop caring about new lingo!"
            else "Nothing special"

{-
This function is a mess. We have some options to fix this horrible thing: using guards or
using pattern matching. Lets see how does it work with pattern matching
-}

specialBirthday' :: Int -> [Char]
specialBirthday' 1 = "First birthday!"
specialBirthday' 18  = "You're an adult!"
specialBirthday' 60  = "Finally, I can stop caring about new lingo!"
specialBirthday' age = "Nothing special" ++ show age

{-
How does this work? Well, when giving this kind of definitions, the Haskell compiler will try to
match the function argument with one of the cases we defined. If the argument does not match with
none of the defined cases, then there is the las option which is called "Catch-all patterns" which
works as a else clause in the if statements.
-}

{-
Some important aspect to consider is that one allways have to pattern match for all posible scenarios.
Otherwise when compiling the program we'll get a warning.
-}

{-
The catch all pattern must be at the bottom of the cases since Haskell tries to pattern match in the
order we gave the cases.
-}

{-
Now, lets take a closer look to lists. The way Haskell see lists is the following:
    [1,2,3,4] == 1:2:3:4:[] -- True
    "Hello!" == 'H':'e':'l':'l':'o':'!':[] -- True
An example in how we can use this to our advantage is shown in the following function
-}

whatsInsideThisList :: [Int] -> String
whatsInsideThisList [] = "It's empty!"
whatsInsideThisList [x] = "A single element!" ++ show x
whatsInsideThisList [x, y] = "Two elements: " ++ show x ++ " and " ++ show y
whatsInsideThisList (x:y:z:[]) = "The list has three elements: " ++ show x ++ show y ++ show z
whatsInsideThisList (x:rest)   = "The first element is: " ++ show x ++ ", and there are quite a few more!"

{-
There is another way to do pattern matching with lists. If we don't want to care about variables we can
do something similar to the next function
-}

firstAndThird :: [Bool] -> String
firstAndThird (x:_:z:_) = "The first and third elements are: " ++ show x ++ " and " ++ show z
firstAndThird _ = "Don't have them!"

{-
Tis is a function wich given a list of boolean values, returns the first and third element. The way we do
that is using "_". 
-}

{-
Knowing about the operator "_" let us modify the function

  initials :: String -> String -> String
    initials name lastName = if name == "" || lastName == ""
                         then "How was your name again?"
                         else let x = head name
                                  y = head lastName
                              in [x] ++ "." ++ [y] ++ "."

as follows
-}

initials :: String -> String -> String
initials (f:_) (l:_)= [f] ++ "." ++ [l] ++ "."
initials _ _ = "How was youre name again?"

{-
Another powerfull use for pattern matching is handeling tuples
-}

firstOfThree :: (a, b, c) -> a
firstOfThree (x, _, _) = x

pairFromFour :: (a, b, c, d) -> (a, c)
pairFromFour (x, _, y, _) = (x, y)

{-
Now, lets consider the case structure. We can use pattern matching here to use the case as switch in other
programming languages. This is an example of how to use it
-}

checkForZeros :: (Int, Int, Int) -> String
checkForZeros tuple3 = case tuple3 of
  (0, _, _) -> "The first one is a zero!"
  (_, 0, _) -> "The second one is a zero!"
  (_, _, 0) -> "The third one is a zero!"
  _         -> "We're good!"