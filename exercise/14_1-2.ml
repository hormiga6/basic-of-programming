#use "10_6.ml"

(* 整数のlistから偶数のみを返す *)
let even list =
	let even_number number = number mod 2 = 0 in
	List.filter even_number list

let t1 = even [1;2;3;4] = [2;4]

(* 学生リストのうち成績がAの人の数を返す *)
let count_A list =
	let is_A gakusei =
		let {namae=namae;tensuu=tensuu;seiseki=seiseki} = gakusei in
		seiseki = "A" in
	List.length (List.filter is_A list)

let t1 = count_A [
		{namae="Bob";tensuu=99;seiseki="A"};
		{namae="Ed";tensuu=100;seiseki="A"};
		{namae="Jimmy";tensuu=1;seiseki="B"};
	] =	2
