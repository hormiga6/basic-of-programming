(* 学生一人分のデータ *)
type gakusei_t = {
	namae: string;
	tensuu: int;
	seiseki: string;
}

(* 目的: gakusei_tのリストを受け取ったら、その中から最高得点を取った人のレコードを返す *)
let rec gakusei_max list = match list with
	| [] -> {namae="";tensuu=min_int;seiseki=""}
	| first::rest -> let prev_max = gakusei_max rest in
		match prev_max with
			{namae=g1_namae;tensuu=g1_tensuu;seiseki=g1_seiseki} ->
				match first with
				{namae=g2_namae;tensuu=g2_tensuu;seiseki=g2_seiseki} ->
					if g1_tensuu < g2_tensuu then first else prev_max

let t1 = gakusei_max [
		{namae="Bob";tensuu=99;seiseki="A"};
		{namae="Ed";tensuu=100;seiseki="A"};
		{namae="Jimmy";tensuu=1;seiseki="B"};
	] =	{namae="Ed";tensuu=100;seiseki="A"}

let t2 = gakusei_max [
	] =
		{namae="";tensuu=min_int;seiseki=""}
