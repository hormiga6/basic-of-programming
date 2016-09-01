(* 学生一人分のデータ *)
type gakusei_t = {
	namae: string;
	tensuu: int;
	seiseki: string;
}

(* 目的: あらかじめtensuu昇順に並んでいる整数のgakusei_tのリストを受け取ったら、
   昇順となる位置にgakusei_tを挿入したリストを返す関数 *)

let rec insert_gakusei gakusei_list gakusei = match gakusei_list with
	| [] -> [gakusei]
	| ({namae=first_namae;tensuu=first_tensuu;seiseki=first_seiseki} as first)::remain ->
		match gakusei with
			{namae=target_namae;tensuu=target_tensuu;seiseki=target_seiseki;}
				-> if (target_tensuu <= first_tensuu ) then gakusei :: first ::remain
					 else  first :: insert_gakusei remain gakusei

let test_list = [{namae = "Bom";tensuu = 1; seiseki = "C";};
				 {namae = "Dom";tensuu = 2; seiseki = "C";};]
let t1 = insert_gakusei test_list {namae = "Ed";tensuu = 0; seiseki = "C";}
		 = [
			{namae = "Ed";tensuu = 0; seiseki = "C";};
		 	{namae = "Bom";tensuu = 1; seiseki = "C";};
			{namae = "Dom";tensuu = 2; seiseki = "C";};
		 ]
let t2 = insert_gakusei test_list {namae = "Ed";tensuu = 1; seiseki = "C";}
		 = [
			{namae = "Ed";tensuu = 1; seiseki = "C";};
		 	{namae = "Bom";tensuu = 1; seiseki = "C";};
			{namae = "Dom";tensuu = 2; seiseki = "C";};
		 ]
let t3 = insert_gakusei test_list {namae = "Ed";tensuu = 3; seiseki = "C";}
		 = [
		 	{namae = "Bom";tensuu = 1; seiseki = "C";};
			{namae = "Dom";tensuu = 2; seiseki = "C";};
			{namae = "Ed";tensuu = 3; seiseki = "C";};
		 ]

(* 目的: gakusei_tのリストを受け取ったらそれを昇順に並べたリストを返す。 *)
let rec sort_gakusei gakusei_list = match gakusei_list with
	| [] -> []
	| first::rest -> insert_gakusei (sort_gakusei rest) first

let t4 = sort_gakusei
		 [
			{namae = "Dom";tensuu = 2; seiseki = "C";};
			{namae = "Ed";tensuu = 0; seiseki = "C";};
		 	{namae = "Bom";tensuu = 1; seiseki = "C";};
		 ] =
		 [
			{namae = "Ed";tensuu = 0; seiseki = "C";};
		 	{namae = "Bom";tensuu = 1; seiseki = "C";};
			{namae = "Dom";tensuu = 2; seiseki = "C";};
		 ]

let t5 = sort_gakusei
		 [
		 	{namae = "Bom";tensuu = 1; seiseki = "C";};
			{namae = "Dom";tensuu = 2; seiseki = "C";};
			{namae = "Ed";tensuu = 0; seiseki = "C";};
		 ] =
		 [
			{namae = "Ed";tensuu = 0; seiseki = "C";};
		 	{namae = "Bom";tensuu = 1; seiseki = "C";};
			{namae = "Dom";tensuu = 2; seiseki = "C";};
		 ]