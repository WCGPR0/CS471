import Hw10

assert False s = error (s ++ " failed!")
assert True s  = print (s ++ " passed!")

main = do
  assert (sum_all [] == 0) "sum_all0"
  assert (sum_all [1,2,3] == 6) "sum_all1"

  
  assert (sum_all_tail [] == 0) "sum_all_tail0"
  assert (sum_all_tail [1,2,3] == 6) "sum_all_tail1"

  
  assert (insert_at 10 0 [1,2,3] == [10,1,2,3]) "insert_at0"
  assert (insert_at 'a' 1 "abc" == "aabc") "insert_at1"
  assert (insert_at 'a' 4 "abc" == "abca") "insert_at2"

  
  assert (delete_at 0 [1,2,3] == [2,3]) "delete_at0"
  assert (delete_at 1 "abc" == "ac") "delete_at1"
  assert (delete_at 4 "abc" == "ab") "delete_at2"


  assert (replicate_each 1 "abc" == "abc") "replicate_each0"
  assert (replicate_each 2 "abc" == "aabbcc") "replicate_each1"
  assert (replicate_each 0 "abc" == "") "replicate_each2"
  assert (replicate_each 3 [1,2] == [1,1,1,2,2,2]) "replicate_each3"

  assert (bit_flip "01" == "10") "bit_flip0"
  assert (bit_flip "1001" == "0110") "bit_flip1"
  assert (bit_flip [] == []) "bit_flip2"


  assert (to_ascii [97,99,97] == "aca") "to_ascii0"
  assert (to_ascii [100,101,97,100,98,101,101,102] == "deadbeef") "to_ascii1"
  assert (to_ascii [] == []) "to_ascii3"

  assert (from_hex "a" == 10) "from_hex0"
  assert (from_hex "10" == 16) "from_hex1"
  assert (from_hex "100" == 256) "from_hex3"
  assert (from_hex "1ff" == 511) "from_hex4"

  assert (sum_all' [] == 0) "sum_all'0"
  assert (sum_all' [1,2,3] == 6) "sum_all'1"

  assert (to_ascii' [97,99,97] == "aca") "to_ascii'0"
  assert (to_ascii' [100,101,97,100,98,101,101,102] == "deadbeef") "to_ascii'1"
  assert (to_ascii' [] == []) "to_ascii'3"

  assert (bit_flip' "01" == "10") "bit_flip'0"
  assert (bit_flip' "1001" == "0110") "bit_flip'1"
  assert (bit_flip' [] == []) "bit_flip'2"

  assert (replicate_each' 1 "abc" == "abc") "replicate_each'0"
  assert (replicate_each' 2 "abc" == "aabbcc") "replicate_each'1"
  assert (replicate_each' 0 "abc" == "") "replicate_each'2"
  assert (replicate_each' 3 [1,2] == [1,1,1,2,2,2]) "replicate_each'3"

  
