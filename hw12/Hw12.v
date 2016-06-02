(* Homework Assignment 12
   Programming Languages
   CS471, Spring 2016
   Binghamton University *)

(* <h1>Instructions</h1> *)
 
(* You will know that you have proved all the theorems if you are able to compile (interactively) the entire file after you have removed all traces of Admitted. *)

(* <h1>Submission</h1> *)

(* For this assignment you must submit only the source (template) file. There is no need to tar anything as all coding should be done directly in Hw12.v. *)

(* <h1>Homework 12</h1> *)

(* Due: Friday, 5/6 at 5:00 PM *)

(* Purpose: To gain some appreciation for the more powerful languages that exist. *)

(* Useful tactics:
 * intros : Introduce as many assumptions as possible
 * apply H : Apply hypothesis H to current goal and switch to solving its premise (modus ponens)
 * split : Splits a conjunction (if it's the current goal) into two subgoals (one for each conjunct)
 * left : Switch to proving the left side of a disjunction (if its the current goal)
 * right : Switch to proving the right side of a disjunction (if its the current goal)
 * elim H : Depending upon H
 *  (H = A /\ B) : Will switch to solving A -> B -> Current Goal, for which you may intros and assume A and B are true.
 *  (H = A \/ B) : Will switch to solving A -> Current Goal and B -> Current Goal, for which you may intros and assume A and B are true (for each goal respectively).
 *  rewrite H : Rewrite terms in the current goal using H (where H is some form of equivalence theorem)
 *  induction e : Proceed with proof by induction on some inductively defined term e. This will automatically introduce an induction hypothesis.
 *) 

Require Import Arith.  

Inductive mybool : Set :=
| MTrue
| MFalse.

Definition mybool_and (b1 b2 : mybool) : mybool :=
  match b1, b2 with
  | MTrue, MTrue  => MTrue
  | _, _          => MFalse
  end.

Definition mybool_or (b1 b2 : mybool) : mybool :=
  match b1, b2 with
  | MFalse, MFalse  => MFalse
  | _, _            => MTrue
  end.

Definition myboolDenote (b : mybool) : bool :=
  match b with
  | MTrue => true
  | MFalse => false
  end.

(* Problem 1 *)
Theorem mybool_and_behaves : forall (b1 b2 : mybool), 
  myboolDenote (mybool_and b1 b2) = andb (myboolDenote b1) (myboolDenote b2).
Proof.
  Admitted.

(* Problem 2 *)
Theorem mybool_or_behaves : forall (b1 b2 : mybool), 
  myboolDenote (mybool_or b1 b2) = orb (myboolDenote b1) (myboolDenote b2).
Proof.
  Admitted.

Definition mybool_neg (b : mybool) : mybool := 
  match b with
  | MTrue  => MFalse
  | MFalse => MTrue
  end.

(* Problem 3 *)
Theorem mybool_neg_behaves : forall (b : mybool), 
  myboolDenote (mybool_neg b) = negb (myboolDenote b).
Proof.
  Admitted.

Inductive mynat : Set :=
| Zero : mynat
| Succ : mynat -> mynat.

Definition inc (n : mynat) : mynat := Succ n.
Definition dec (n : mynat) : mynat := 
  match n with
  | Zero => Zero
  | Succ n'  => n'
  end.

(* Problem 4 *)
Theorem dec_inc_n : forall (n : mynat), dec (inc n) = n.
  Admitted.

Inductive Tree : Set :=
| Leaf : Tree
| Node : nat -> Tree -> Tree -> Tree.

Fixpoint tree_size (tr : Tree) : nat :=
  match tr with
  | Leaf => O
  | Node _ l r  => S (plus (tree_size l) (tree_size r))
  end.

(* Problem 5 *)
Theorem trivial_tree_size : forall (n:nat)(l r: Tree),
  tree_size (Node n l r) = S (plus (tree_size l) (tree_size r)).
Proof.
  Admitted.


