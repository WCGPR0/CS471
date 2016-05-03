module Hw10
  where

{- Homework Assignment 10
   Programming Languages
   CS471, Spring 2016
   Binghamton University -}

{- <h1>Instructions</h1> -}

{- This section deals with general submission instructions. First, grab this assignment's <a href="Hw10.hs">template source file</a>. You will be able to code in and run the file in ghci directly. NOTE: Do not rename the file, it must be named Hw10.hs. I recommend reading this assignment directly from the source file. 
 
BEFORE MOVING ON: Use spaces when writing Haskell, as you cannot intermix spaces and tabs. Its fine to use the tab key, just make sure it emits spaces. If you are seeing weird parsing errors, this is most likely the reason.
 
I have provided a small test harness that you may use to test your code. Grab <a href="hw10_test.hs">hw10_test.hs</a> and its associated <a href="Makefile">Makefile</a>. Each function that you must write has some associated tests, commented out by default. As you answer the quests, uncomment the tests for each function, and run <code>make test</code>. If everything is correct, you should see "TEST passed!" for each test, otherwise an error will be thrown. 

In addition, I have provided the type signatures for each function you must write (again, initially commented out). Uncomment each as you write your code. They are there to help reduce confusion about what is expected; the tests provide simple documentation as well.

NOTE: I HIGHLY recommend you write your Haskell code and reload into ghci to run some expressions like I did in class BEFORE testing using the tester. It's equally important for you to interact and experiment with the code you write. -}

{- <h1>Submission</h1> -}

{- For this assignment you must submit only the source (template) file. There is no need to tar anything as all coding should be done directly in Hw10.hs. -}

{- <h1>Homework 10</h1> -}

{- Due: Wednesday, 2/20 at 11:59 PM -}

{- Purpose: To get comfortable with functional programming, and get a good grasp on list manipulation in Haskell. -}

{- <h3>Problem 0A (NOT GRADED):</h3> 
Given the following expressions, show a step by step (commonly referred to as small-step reduction) evaluation for each. 
(A) if 1+2==3 then "a" else "b"
(B) let x = 3 in if x == 0 then x + 1 else x - 1
(C) let sum = \x -> \y -> x + y in sum (sum 1 2) 3
(D) let sum = \x -> \y -> x + y in let add_5 = sum 5 in add_5 10
(E) let sum = \x -> \y -> x + y in let add_5 = sum 5 in sum (add_5 10) (add_5 10)

For example, the following is a small-step reduction for (B)
(0) let x = 3 in if x == 0 then x + 1 else x - 1
(1) [x -> 3] if x == 0 then x + 1 else x - 1
(2) if 3 == 0 then 3 + 1 else 3 - 1
(3) if False then 3 + 1 else 3 - 1
(4) 3 - 1
(5) 2

NOTE: You must show the pre-substitution step (1) in the reduction: [x -> 3]t means substitute 3 in for x over the term t, 
where t is "if x == 0 then x + 1 else x - 1" -} 

{- <h3>Problem 0B (NOT GRADED):</h3> 
Convert the following function definitions to lambda notation with a let binding, 
where no lambda may take more than one argument.
(A) sum x y = x + y
(B) max x y = if x > y then x else y
(C) fact x = if x == 0 then 1 else x * fact (x-1)
(D) triple_sum x y z = x + y + z

For example, (A) converted to lambda notation is let sum = \x -> \y -> x + y. You may drop the "in" part of the let binding, which is valid syntax in the Haskell interpreted environment only. -}

{- <h3>Problem 1:</h3> 
Write a function "sum_all ls" that takes a list of numbers and returns the sum of all of them. -}

{- <h3>Problem 1 Answer:</h3> -}
sum_all :: Num a => [a] -> a
sum_all [] = 0
sum_all (a:as) = a + sum_all as

{- <h3>Problem 2:</h3> 
Write a function "sum_all_tail ls" that takes a list of numbers and returns the sum of all, except that it must be tail recursive.  A function is tail recursive if it may simply return as result when the recursion stops. In other words, the stack does not need to "unwind" to finish computation. -}

{- <h3>Problem 2 Answer:</h3> -}
sum_all_tail :: Num a => [a] -> a
sum_all_tail b = sumHelper b 0 where
	sumHelper (a:as) sum = sumHelper as sum+a
	sumHelper [] sum = sum	

{- <h3>Problem 3:</h3> 
Write a function "insert_at x n ls" that inserts x at the nth position in ls. If n is greater than the length of ls, simply insert it at the end.

Remember, Haskell is "pure", so you may not modify ls. Instead, you should recurse and build a new list from ls with x inserted. -} 

{- <h3>Problem 3 Answer:</h3> -}
insert_at :: (Eq a, Num a) => b -> a -> [b] -> [b]
insert_at x _ [] = [x]
insert_at x 0 ls = x:ls
insert_at x n (l:ls) = l:insert_at x (n-1) (ls)

{- <h3>Problem 4:</h3> 
Write a function "delete_at n ls" that removes the nth element from ls. If n is greater than the length of ls, simply remove the last element. -}

{- <h3>Problem 4 Answer:</h3> -}

delete_at :: (Eq a, Num a) => a -> [b] -> [b]
delete_at _ [l] = []
delete_at 0 (l:ls) = ls
delete_at n (l:ls) = l:delete_at (n-1) (ls)

{- COOLER WAY!! 
delete_at n (ls) = filter( /= (ls !! n)) ls
-}

{- <h3>Problem 5:</h3> 
Write a function "replicate_each n ls" returns a list consisting of each element of ls replicated n times.  It will help to define a local function using "where".  -}

{- <h3>Problem 5 Answer:</h3> -}
replicate_each :: (Eq a, Num a) => a -> [b] -> [b]
replicate_each _ [] = []
replicate_each 0 _ = []
replicate_each 1 ls = ls
replicate_each n (l:ls) = (duplicate n l) ++ (replicate_each n ls)
	where
		duplicate 1 b = [b]
		duplicate n b = b:duplicate(n-1) b

		
{- <h3>Problem 6:</h3> 
Write a function "blit_flip bs" that takes a string representation of a binary value and returns another string with the bits flipped. Remember, a string is simply a list of Char.

For example,
bit_flip "0" returns "1"
bit_flip "10" returns "01" -}

{- <h3>Problem 6 Answer:</h3> -} 
bit_flip :: [Char] -> [Char]
bit_flip [] = []
bit_flip (l:ls)
	| l == '0' = '1' : bit_flip ls
	| l == '1' = '0' : bit_flip ls
    
{- <h3>Problem 7:</h3> 
Write a function "to_ascii ls" that takes a list of ascii integer values from 97 - 102 (a-f) and returns a list with each integer value replaced by its corresponding char value. 

For example,
to_ascii [97,99,97] returns "aca" -}

{- <h3>Problem 7 Answer:</h3> -}
--to_ascii :: (Eq a, Num a) => [a] -> [Char]
to_ascii :: (Eq a, Num a) => [a] -> [Char]
to_ascii [] = []
--to_ascii (l:ls) = toEnum l :: Char : to_ascii ls -- WHY DOESNT THIS WORK :(
to_ascii (l:ls)
	| l == 97 = 'a' : to_ascii ls
	| l == 98 = 'b' : to_ascii ls
	| l == 99 = 'c' : to_ascii ls
	| l == 100 = 'd' : to_ascii ls
	| l == 101 = 'e' : to_ascii ls
	| l == 102 = 'f' : to_ascii ls

{- <h3>Problem 8:</h3> 
Write a function "from_hex hx" that takes a string encoding of a hexidecimal integer and returns the converted integer in base 10.

First, reverse the string using the bultin reverse function, then simply inspect each element. It will help to define a local function to help keep track of the current digit place you are inspecting. A blueprint of steps looks something like...
reverse "11a" to get "a11"
look at 'a' with digit place 0, convert
look at '1' with digit place 1 (previous + 1), convert
look at '1' with digit place 2 (previous + 1), convert

I've included an individual digit conversion function to make your lives easier, named from_hexd.

For example,
from_hex "a" returns 10
from_hex "10" returns 16
from_hex "1a" returns 26 -}

from_hexd :: Num a => Char -> a
from_hexd h =
 	case h of
		'0' -> 0
		'1' -> 1
		'2' -> 2
		'3' -> 3
		'4' -> 4
		'5' -> 5
		'6' -> 6
		'7' -> 7
		'8' -> 8
		'9' -> 9
		'a' -> 10
		'b' -> 11
		'c' -> 12
		'd' -> 13
		'e' -> 14
		'f' -> 15 

{- <h3>Problem 8 Answer:</h3> -}
from_hex :: Num a => [Char] -> a
from_hex ls = inspect_hex (reverse ls) 0
	where
		inspect_hex [] _ = 0
		inspect_hex (l:ls) n = from_hexd l * (16 ^ n) + inspect_hex ls (n+1)


{- <h3>Problem 9:</h3> 
Write a function 'sum_all' ls" (read sum_all prime) that sums a list of numbers. 

The functionality is the same as sum_all, except that you must use higher-order functions.  Your sum_all' should call another function (foldl). If you do this correctly, the answer is one line.  -}

{- <h3>Problem 9 Answer:</h3> -}
sum_all' :: Num a => [a] -> a
sum_all' ls = foldl(\a b -> a+b) 0 ls

{- <h3>Problem 10:</h3> 
Write a function "to_ascii' ls" that takes a list of ascii integer values from 97 - 102 (a-f) and returns a list with each integer value replaced by its corresponding char value. 

The functionality is the same as "to_ascii" except that you must use a higher-order function.  I recommend using map, although it can also be done using a fold. -}

{- <h3>Problem 10 Answer:</h3> -}
to_ascii' :: (Eq a, Num a) => [a] -> [Char]
to_ascii' ls = map to_ascii'' ls
	where
		to_ascii'' 97 = 'a'
		to_ascii'' 98 = 'b'
		to_ascii'' 99 = 'c'
		to_ascii'' 100 = 'd'
		to_ascii'' 101 = 'e'
		to_ascii'' 102 = 'f'

{- <h3>Problem 11:</h3> 
Write a function "blit_flip' bs" that takes a string representation of a binary value and returns another string with the "bits" flipped. Remember, a string is simply a list of Char. 

The functionality is the same as "bit_flip" except that you must use a higher-order function.  I recommend using map, although it can also be done using a fold. -}

{- <h3>Problem 11 Answer:</h3> -} 
bit_flip' :: [Char] -> [Char]
bit_flip' ls = map bit_flip'' ls
	where
		bit_flip'' '0' = '1'
		bit_flip'' '1' = '0' 

{- <h3>Problem 12:</h3> 
Write a function "replicate_each n ls" returns a list consisting of each element of ls replicated n times.  It will help to define a local function using "where".  

The functionality is the same a "replicate_each" except that you must use a higher-order function.  One approach is to map a partially evaluated replicate helper function onto each element, giving you a list of lists. Then, use a fold to concat everything together.

Another approach is to simply use a fold, and replicate and concat at the same time. -}

{- <h3>Problem 12 Answer:</h3> -}
replicate_each' :: (Eq a, Num a) => a -> [b] -> [b]
replicate_each' n ls = foldl (++) [] (map(replicate_each'' n) ls)
	where
		replicate_each'' 0 _ = []	
		replicate_each'' 1 l = [l]
		replicate_each'' n l = l : replicate_each'' (n-1) l
