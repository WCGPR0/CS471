module Hw11
  where

{- Homework Assignment 11
   Programming Languages
   CS471, Spring 2016
   Binghamton University -}

{- <h1>Instructions</h1> -}

{- This section deals with general submission instructions. First, grab this assignment's <a href="Hw11.hs">template source file</a>. You will be able to code in and run the file in ghci directly. NOTE: Do not rename the file, it must be named Hw11.hs. I recommend reading this assignment directly from the source file. 
 
BEFORE MOVING ON: Use spaces when writing Haskell, as you cannot intermix spaces and tabs. Its fine to use the tab key, just make sure it emits spaces. If you are seeing weird parsing errors, this is most likely the reason.
 
I have provided a small test harness that you may use to test your code. Grab <a href="hw11_test.hs">hw11_test.hs</a> and its associated <a href="Makefile">Makefile</a>. Each function that you must write has some associated tests, commented out by default. As you answer the quests, uncomment the tests for each function, and run <code>make test</code>. If everything is correct, you should see "TEST passed!" for each test, otherwise an error will be thrown. 

In addition, I have provided the type signatures for each function you must write (again, initially commented out). Uncomment each as you write your code. They are there to help reduce confusion about what is expected; the tests provide simple documentation as well.

NOTE: I HIGHLY recommend you write your Haskell code and reload into ghci to run some expressions like I did in class BEFORE testing using the tester. It's equally important for you to interact and experiment with the code you write. -}

{- <h1>Submission</h1> -}

{- For this assignment you must submit only the source (template) file. There is no need to tar anything as all coding should be done directly in Hw11.hs. -}

{- <h1>Homework 11</h1> -}

{- Due: Wednesday, 5/4 at 11:59 PM -}

{- Purpose: To get comfortable with abstract data types and variants. -}

{- <h3>Problem 0A (NOT GRADED):</h3> 
Given the following types, state (in one sentence for each) what they describe. 
(A) Num a => a -> a -> a
(B) Num a => a -> (a -> a)
(D) Eq a => a -> a -> Bool
(E) (a -> b) -> [a] -> [b]
(F) (a -> b -> a) -> a -> [b] -> a
(G) (a -> a) -> a -> a
(H) (b -> c) -> (a -> b) -> a -> c
(I) (a -> Bool) -> [a] -> [a] -}

{- <h3>Problem 0B (NOT GRADED):</h3>
Given the following partially applied functions (all of which are valid) predict thier type. Before jumping to :t, first check the type of the function un-applied. Then, try and figure out what the partially applied function must accept after the first argument is applied in order to type check.

For example,
:t (+)
Num a => a -> a -> a
Then, (+) 1 removes one of the arguments (since it returns a new function). In order to type check, I should "expect" another a.
:t (+) 1
Num a => a -> a

(A) (+) 1
(B) (+) 1 2
(C) map (\x -> x * 2)
(D) replicate 10 'a'
(E) foldl (\y x -> x : y)
(D) foldr (\x y -> x : y)
(F) map (\x -> x > 0) -}

data Optional a 
  = None
  | Some a
  deriving (Show, Eq)

{- <h3>Problem 1:</h3> 
The following is a recursive definition of a natural number. We will use for the next several problems. It's customary to represent a natural number as either O (the letter O) or S n where n is another natural number. 

For example, 0 would be encoded as O, 1 would be encoded as S O, 2 would be encoded as S (S O) etc. For reference, I have provided a function nat_of_int that takes an Int and converts it to a Nat. -}
data Nat 
  = O
  | S Nat
  deriving (Show, Eq)

nat_of_integer :: Integer -> Nat
nat_of_integer n
  | n < 0   = error "nat numbers must be positive"
  | n == 0  = O
  | n > 0   = S (nat_of_integer (n-1))

{- Now, write a function "nat_add n m" that adds two Nat numbers. You will have to use pattern matching, and may not "convert" to a non-encoded form. -}

{- <h3>Problem 1 Answer:</h3> -}
--nat_add :: Nat -> Nat -> Nat

{- <h3>Problem 2:</h3> 
Write a function "nat_sub n m" that subtracts two Nat numbers. Note that unlike the conversion function nat_of_int, it would be considered a valid user error to subtract m from n where m > n. We will use the Optional data type above to handle this case. If m > n, return None, otherwise return Some (n-m) -}

{- <h3>Problem 2 Answer:</h3> -}
--nat_sub :: Nat -> Nat -> Optional Nat

{- <h3>Problem 3:</h3>
Write a function nat_mult n m" that multiplies two Nat numbers. You may use your definition of nat_add in your function. -}

{- <h3>Problem 3 Answer:</h3> -}
--nat_mult :: Nat -> Nat -> Nat

{- <h3>Problem 4:</h3>
Now, we are going to implement the Num typeclass for our Nat number. I have taken the liberty of filling in some of the functions. You must handle +, - and *. Note that for -, you must unwrap the Optional (simply give O if you see a None). 

You will know you have done it correctly if you can use all of the above operators on Nat numbers; moreover, you have significantly MORE computational power. 

For example, try the following function applications in ghci (after answering #4)
3 + O
3 + (S (S (S O)))
2 * (S (S (S O)))
(S (S O)) ^ 3
Essentially, any function that takes a Num will now "work" on a Nat -- exception being anything that requires negative numbers. You will get an answer, but it may not be what you expect. -}

{- <h3>Problem 4 Answer:</h3> -}
{-
instance Num Nat where
  {- Define +, -, and * -}

  negate n = n
  
  abs n = n

  signum O      = O
  signum (S _)  = S O
  
  fromInteger n = nat_of_integer n
-}

{- <h3>Problem 5:</h3>
It will be useful to define a conversion function "int_of_nat" that converts a Nat to a standard Int. Go ahead and write one -- I will not check for tail recursion, but you should be able to write it both ways by now. I expect you to convert a trivial non-tail recursive function to a tail recursive one on the test. -}

{- <h3>Problem 5 Answer:</h3> -}
--int_of_nat :: Nat -> Int

{- <h3>Problem 6:</h3>
So far our recursive definition of a natural number may seem "verbose" and inefficient compared to "normal" implementations of numbers. This is true; (+) over Int/Integer (in Haskell, and in all languages) is a constant operation, (+) over Nat is O(n). 

In reality, the recursive (inductive) definition is the ONLY definition -- all other implementations are optimizations. In particular, the strength of the inductive definition is that we may restrict computation over Nat numbers to that which must always terminate. This is done by allowing recursion on sub-terms only (i.e, if we pattern match S n, we may only perform an operation on 'n'). This is incredibly useful when mechanically proof checking software (although the language is no longer Turing-Complete).

We are not going to that, but we will take advantage of our inductive definition to define a foldl and foldr over a Nat number. The following are hand-coded implementations of foldl and foldr over Haskell lists. Study them to see how the combination is performed. -}
my_foldl :: (a -> b -> a) -> a -> [b] -> a
my_foldl f combination [] = combination
my_foldl f combination (x:xs) = my_foldl f (f combination x) xs

my_foldr :: (b -> a -> a) -> a -> [b] -> a
my_foldr f combination [] = combination
my_foldr f combination (x:xs) = f x (my_foldr f combination xs)

{- Now, write two functions, "nat_foldl f combination n" and "nat_foldr f combination n" that perform a left fold and right fold over a Nat number. It is "almost" a one-to-one translation of the above fold definitions. 

Our base case is O, and as a result is not included in the combination; hence, 
a nat_foldl on "5" should perform the combination on 5, 4, 3, 2 and 1.
a nat_foldr on "5" should perform the combination on 1, 2, 3, 4, and 5. -}

{- <h3>Problem 6 answer:</h3> -}
--nat_foldl :: (a -> Nat -> a) -> a -> Nat -> a

--nat_foldr :: (Nat -> a -> a) -> a -> Nat -> a

{- <h3>Problem 7:</h3>
It is now trivial to perform operations over Nat numbers with our definition of nat_foldl, nat_foldr, and our implementation of the Num typeclass. To demonstrate this, write a function "nat_fact n" that performs factorial using either nat_foldl or nat_foldr; remember that the factorial of a number is the multiplication of that number and all previous numbers, excluding 0 (0 is excluded from the folds). 

Use int_of_nat to check you get the expected answer -- 120 (fact 5) isn't too readable in Nat form. -}

{- <h3>Problem 7 Answer:</h3> -}
--nat_fact :: Nat -> Nat

{- <h3>Problem 8:</h3>
The following is the inductive definition of a binary tree that we have used several times in class, along with two functions tree_search and tree_insert, both also done in class. I expect you to be able to reproduce them, and I will ask you to manipulate a binary tree on the test -- probably along the lines of write tree_search or tree_insert -- so please study them. -}

data Tree a
  = Nil
  | Node a (Tree a) (Tree a)
  deriving Eq

instance Show a => Show (Tree a) where
  show t = show' t 0
    where
      show' Nil ind = replicate ind ' ' ++ "Nil"
      show' (Node v l r) ind = 
        replicate ind ' ' ++ "(Node " ++ show v ++ "\n" ++ 
        show' l (ind+1) ++ "\n" ++
        show' r (ind+1) ++ "\n" ++
        replicate ind ' ' ++ ")"

tree_search :: Ord a => Tree a -> a -> Bool
tree_search Nil v = False
tree_search (Node e l r) v
  | v == e    = True
  | v < e     = tree_search l v
  | v > e     = tree_search r v

tree_insert :: Ord a => Tree a -> a -> Tree a
tree_insert Nil v = (Node v Nil Nil)
tree_insert nd@(Node e l r) v
  | v == e    = nd
  | v < e     = (Node e (tree_insert l v) r)
  | v > e     = (Node e l (tree_insert r v))

{- I have also provided a few default binary search trees so you do not need to keep entering them into ghci. You may simply type tree1 at the prompt to dump the tree. Same goes for using tree1 in a function at the prompt: tree_insert tree1 10 will "insert" 10 into tree1 (but remember that you really get a new tree back).-}
 
tree1 = (Node 5 (Node 2 (Node 1 Nil Nil) (Node 3 Nil Nil)) (Node 7 Nil (Node 9 Nil Nil)))
tree2 = (Node 5 (Node 2 (Node 1 Nil Nil) Nil) (Node 7 Nil (Node 9 Nil Nil)))

{- Of course, the previous two functions are predicated on the invariant that the binary tree is in fact a binary search tree. Write a predicate, "is_bst t" that returns True if t is a binary search tree, and false otherwise. My solution has 5 cases, all of them fairly trivial; remember, you may match more than one pattern at a time. -}

{- <h3>Problem 8 Answer:</h3> -}
--is_bst :: (Ord a) => Tree a -> Bool

{- <h3>Problem 9 </h3>
Write a function "tree_merge t1 t2" that will merge two binary search trees. Duplicates may (and will be removed) if you use tree_insert above. It will help to use a let or where binding here; you will have to merge a nodes left subtree with t2 to get a new tree that you then merge with the right etc. -}

{- <h3>Problem 9 Answer: </h3> -}
--tree_merge :: (Ord a) => Tree a -> Tree a -> Tree a

{- <h3>Problem 10 </h3> 
Like we did with Nat, we are going to take advantage of our inductive definition of a Tree and define a function called 'tree_fold f combination tree" that combines all the values of a tree inorder. In reality, this is no different than performing an inorder traversal of the tree, except that you are combining values along the way.

Here is a rough sketch of the algorithm to help you get started:
  (0) tree_fold f combination Nil = combination   (returns the combination thus far)
  (1) tree_fold f combination (Node v l r) =
    (a) Recurse on the left, getting a new combined value
    (b) Perform the combination operation (f) on the current value (v) and the returned value from (a)
    (c) Recurse on the right, passing the new combined value from (b) -}

{- <h3>Problem 10 Answer:</h3> -}
--tree_fold :: (a -> b -> a) -> a -> Tree b -> a

{- <h3>Problem 11 </h3> 
To demonstrate the computational power of tree_fold, write a function "inorder_list tree" that uses tree_fold to build a list of all the elements of tree in order. Since the tree_fold recurses inorder, all you simply need to think about is the lambda that should build the list. If you are struggling with that lambda, take a look at the definitions of reverse that we did in class that reverse a list using a fold. -}

{- <h3>Problem 11 Answer:</h3> -}
--inorder_list :: Tree a -> [a]

{- Good job! :) -}
