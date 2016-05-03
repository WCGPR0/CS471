#! /usr/bin/env runhugs +l
--
-- class.hs
-- Copyright (C) 2016 vwu4 <vwu4@remote06>
--
-- Distributed under terms of the MIT license.
--

cell_reverse :: Cell a -> Cell a
cell_reverse Nil = Nil
cell_reverse (Cons v t) = cell_reverse t @++ (Cons v Nil)


