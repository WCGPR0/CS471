/* Homework Assignment 2
   Programming Languages
   CS471, Spring 2016
   Binghamton University */

/* <h1>Instructions</h1> */

/* This section deals with general submission instructions. First, grab this assignment's <a href="hw3.asn">template source file</a>. BEFORE MOVING ON RENAME hw3.asn to hw3.pl. You will be able to code in and run the file in the prolog interpreter directly. I recommend reading this assignment directly from the source file.

We will be using swipl for our prolog environment: To load/reload this file, cd to its directory and run swipl. Then, in the prompt, type [hw3].

cd PATH_TO_FILE
swipl
[hw3].

From then on you may execute queries (goals) in the prompt. As usual, you should provide your answers in the designated spot. Once you have added some code to the file, rerun [hw3]. in the swipl prompt to reload. 

In addition, there are unit tests for each problem. These are there to help you better understand what the question asks for, as well as check your code. They are included in our "database" as queries and are initially commented out -- % is a Prolog line comment.

%:- member_times(4,[3,3,2,3],0). % SUCCEED
%:- member_times(4,[1,2,3],3).   % FAIL

After you have finished a problem and are ready to test, remove the initial % for each test for the associated problem and reload the assignment file ([hw3].). Each SUCCEED line should silently load and succeed, and each FAIL line should throw a WARNING. If a SUCCEED line throws a WARNING, or a FAIL line fails to, then you solution is not correct. If you pass the tests there is a good chance that your code is correct, but not guaranteed; the tests are meant as guided feedback and are not a check for 100% correctness. */

/* <h1>Submission</h1> */

/* For this assignment -- and the remaing Prolog assignments -- you must submit only the source (template) file. There is no need to tar anything as all coding should be done directly in hw3.pl. */

/* <h1>Homework 3</h1> */

/* Due: Wednesday, 2/17 at 11:59 PM */

/* Purpose: To get comfortable with Logic programming, and get a good grasp on list manipulation in Prolog. */

/* <h3>Problem 0A (NOT GRADED):</h3> 
The following is a mini-database you should use to answer the question.  */
happy(yolanda). 
happy(mia). 
young(john). 

listens_to_music(X) :- happy(X). 
listens_to_music(X) :- young(X).  
/* 1. Name the clauses, predicates, rules, and facts.
2. Name the constants, variables, and complex structures. */

/* <h3>Problem 0B (NOT GRADED):</h3>
Each line is an individual Prolog query; it's a good idea type them in your prompt (not the file itself) to get a feel for the way Prolog works. You should think about whether or not each query will succeed, and if so how the variables will be initialized (unified). You can expect these sort of questions on the test.

X = 1+2.
X is 1+2.
1+2=1+2.
1+2=2+1.
1+2=3.
1+2 is 3.
3 is 1+2.
3 =< 6.
6 =< 3.
X = Y, Y = Z, Z = 3.
X = Y, Y = Z, Z = 3, X = 4.
X = [1,2,3], [H|T] = X.
X = [1,2,3], [H1,H2|T] = X.
X = [1], [H|T] = X.
X = [1], Y = [2|X].
*/

/* <h3>Problem 1:</h3> 
The following are two basic predicates for list manipulation: my_first/2 and my_last/2. We may refer to a predicate by writings it as name/arity; hence, my_first/2 means a predicate named my_first with two arguments. 

my_first(X,Y) succeeds if X is the first element of list Y. my_last(X,Y) succeeds if X is the last element of list Y. */

my_first(X,[X|_]).

my_last(X,[X]).
my_last(X,[_|Ys]) :- my_last(X,Ys).

/* Note my use of the _ (wildcard). It is used to say to Prolog "I don't care, match anything" and should be used to avoid singleton warnings (a variable that is not unified). We will discuss this during lab.

Try the following queries before moving on. Note that they are included in the comment section for a reason: They would be interpreted as facts in the database otherwise. 

my_first(X,[3,a,dd]).
my_last(X,[3,a,dd]).
my_first(3,[3,a,dd]).
my_first(a,[3,a,dd]).
my_last(dd,[3,a,dd]).
my_last(a,[3,a,dd]).

Now, write a predicate my_member(X,Y) that succeeds if X is a member of the list Y. 

NOTE: my_first/2 and my_last/2 are provided as examples for manipulating lists. You should not use them in definition of my_member/2. */

/* <h3>Problem 1 Answer:</h3> */

/* <h3>Problem 1 Test:</h3> */
%:- my_member(3,[1,2,3]).     % SUCCEED
%:- my_member(3,[3]).         % SUCCEED
%:- my_member(4,[1,2,3]).     % FAIL

/* <h3>Problem 2:</h3> 
Write a predicate member_times(X,Y,Z) that succeeds if X is a member of list Y, Z times (Y contains exactly Z copies of X). */

/* <h3>Problem 2 Answer:</h3> */

/* <h3>Problem 2 Test:</h3> */
%:- member_times(3,[1,2,3],1).   % SUCCEED
%:- member_times(3,[3,3,2,3],3). % SUCCEED
%:- member_times(4,[3,3,2,3],0). % SUCCEED
%:- member_times(4,[1,2,3],3).   % FAIL

/* <h3>Problem 3:</h3> 
Write a predicate is_increasing(X) that succeeds if X is a list of increasing numbers -- Each number is either the same or high than the preceding number. 

NOTE: You may match two elements at a time against a list: [X,Y|Xs] = List. It's preferable to do it in the rule head however...
some_rule([X,Y|Xs]) :- ...  */

/* <h3>Problem 3 Answer:</h3> */

/* <h3>Problem 3 Test:</h3> */
%:- is_increasing([]).           % SUCCEED
%:- is_increasing([1]).          % SUCCEED
%:- is_increasing([1,3]).        % SUCCEED
%:- is_increasing([1,3,7]).      % SUCCEED
%:- is_increasing([1,3,7,7,9]).  % SUCCEED
%:- is_increasing([1,1,1,1,1]).  % SUCCEED

%:- is_increasing([1,2,3,1]).    % SUCCEED
%:- is_increasing([3,2,1]).      % SUCCEED
%:- is_increasing([7,1]).        % SUCCEED

/* <h3>Problem 4:</h3>
Write a predicate element_at(X,Y,N) that succeeds if X is the Nth element of list Y. Y is 0-indexed.

NOTE: Don't worry about the error cases: i.e, N greater than the length of Y.  */

/* <h3>Problem 4 Answer:</h3> */

/* <h3>Problem 4 Test:</h3> */
%:- element_at(3,[1,2,3],2).   % SUCCEED
%:- element_at(1,[1,2,3],0).   % SUCCEED

%:- element_at(1,[1,2,3],1).     % FAIL

/* <h3>Problem 5:</h3>
Write a predicate insert_at(X,Y,N,Z) that succeeds if Z is the list Y with X inserted at index N -- Insert X at index N in Y.

NOTE: Don't worry about the error cases: i.e, N greater than the length of Y.  */

/* <h3>Problem 5 Answer:</h3> */

/* <h3>Problem 5 Test:</h3> */
%:- insert_at(3,[1,2,3],2,[1,2,3,3]).  % SUCCEED
%:- insert_at(1,[1,2,3],0,[1,1,2,3]).  % SUCCEED
%:- insert_at(a,[1,2,3],1,[1,a,2,3]).  % SUCCEED

%:- insert_at(1,[1,2,3],0,[1,2,3]).    % FAIL

/* <h3>Problem 6:</h3>
Write a predicate my_zip(X,Y,Z) that succeeds if Z is a list with each element of X and Y paired together. 

For example...
my_zip([1,2,3],[a,b,c],Z) should give Z = [1,a,2,b,3,c]
my_zip([1],[a],Z) should give Z = [1,a]

NOTE: You may assume X and Y have the same length. */

/* <h3>Problem 6 Answer:</h3> */

/* <h3>Problem 6 Test:</h3> */
%:- my_zip([1,2,3],[a,b,c],[1,a,2,b,3,c]). % SUCCEED
%:- my_zip([],[],[]).                      % SUCCEED
%:- my_zip([1],[2],[1,2]).                 % SUCCEED

%:- my_zip([1],[2],[2,3]).                 % FAIL

/* <h3>Problem 7:</h3>
Write a predicate replicated(X,Y) that succeeds if Y is the list X with each element of X replicated X times. 

For example...
replicated([1,2,3],Y) should give Y = [1,2,2,3,3,3].
replicated([4],Y) should give Y = [4,4,4,4].

Our current use of list concatenation and list removal is inadequate for this question. If X = [1], and Y = [2,2], then [X|Y] is not [1,2,2], but [[1],2,2]. 

We need a predicate that will actually append two lists, and not just concatenate an element onto another list. Fortunately, the built-in predicate append/3 will do just that...

append([1],[2,2],Z) will give Z = [1,2,2]. 

Note that append/3 requires two lists, so append(1,[2,2],Z) and append([2,2],1,Z) will fail. To mitigate this issue, wrap an element as a list with one element: append([1],[2,2],Z) and append([2,2],[1],Z).

You might find it helpful to define a helper predicate, repeated(X,Y,N) that succeeds if Y is a list with X repeated N times. */

/* <h3>Problem 7 Answer:</h3> */

/* <h3>Problem 7 Test:</h3> */
%:- replicated([],[]).                 % SUCCEED
%:- replicated([0],[]).                % SUCCEED
%:- replicated([3],[3,3,3]).           % SUCCEED
%:- replicated([1,2,3],[1,2,2,3,3,3]). % SUCCEED

/* <h3>Problem 8:</h3>
Write a predicate reverse_list(X,Y) that succeeds if Y is the list X reversed.

You can and should use the built-in append/3. */

/* <h3>Problem 8 Answer:</h3> */

/* <h3>Problem 8 Test:</h3> */
%:- reverse_list([],[]).             % SUCCEED
%:- reverse_list([1,2,3],[3,2,1]).   % SUCCEED

%:- reverse_list([1,2,3],[3,2,3]).   % FAIL

/* <h3>Problem 9</h3> 
Write a predicate has_subseq(X,Y) that succeeds if Y is a list that is a subsequence of a list X. 

For example...
has_subseq([a,b,c,d],[b,d]) should succeed, but has_subseq([a,b,c,d],[b,e]) should fail. */

/* <h3>Problem 9 Answer:</h3> */

/* <h3>Problem 9 Test:</h3> */
%:- has_subseq([a,g,b,d],[g,b]).     % SUCCEED
%:- has_subseq([1,2,3,4],[2,4]).     % SUCCEED
%:- has_subseq([1,2,3,4],[2,3]).     % SUCCEED

%:- has_subseq([1,2,3,4],[2,5]).     % FAIL
