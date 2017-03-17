(* 二つの自然数mとn(m>=n)の最大公約数を求める *)
let rec gcd m n =
  (* 自明に答えるが出るケースの条件  *)
  if n = 0
  (* mが最大公約数 *)
  then m
  (* それ以外のケース *)
  else (gcd n (m mod n))

let t1 = gcd 10 3 = 1
let t2 = gcd 6 3 = 3
let t3 = gcd 100 75 = 25


let undivided number list  =
  List.filter (fun a -> a mod number != 0) list

let t1 = undivided 2 [2;3;4;5;6;7;8;9;10] = [3;5;7;9]

(* int listは
  - [] 空リスト
  - first::test 最初の要素がfirstで残りのリストがrest(restが自己参照のケース) *)
(* 2以上n以下の自然数のリストを受け取ったら、2以上n以下の自然数のリストを返す *)
let sieve list = match list with
  | [] -> []
  | first::last -> first :: (sieve (undivided first last))
let t1 = sieve [2;3;4;5;6;7;8;9;10] = [2;3;5;7]


