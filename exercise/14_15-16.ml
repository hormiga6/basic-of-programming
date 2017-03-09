let rec enumerate n =
	if n = 0 then [] else n :: enumerate (n - 1)


(* 1から受け取った自然数までの合計を求める *)
let one_to_n num =
	List.fold_right (+) (enumerate num) 0

let t1 = one_to_n 5 = (5 + 4 + 3 + 2 + 1)
let t2 = one_to_n 3 = (3 + 2 + 1)

(* 階乗を求める *)
let fac num =
	List.fold_right ( * ) (enumerate num) 1

let t1 = fac 5 = ( 5 * 4 * 3 * 2 )
let t2 = fac 3 = ( 3 * 2 )
