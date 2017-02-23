(* 14.8 *)
let square_minus_one = fun number -> number * 2 - 1
let t1 = square_minus_one 2 = 3
let t2 = square_minus_one 0 = -1

(* 14.9 *)
type person_t = {
	name:string; (* 名前 *)
	height:float; (* 身長 *)
	weight:float; (* 体重 *)
	month:int; (* 月 *)
	day:int; (* 日 *)
	blood_type:string; (* 血液型 *)
}
let get_name = fun person -> match person with
		| {name=name;height=height;weight=weight;month=month;day=day;blood_type=blood_type;}
		-> name

let yamada = {name="山田"; height=1.75; weight=71.; month=1; day=21; blood_type="A"}
let t3 = get_name yamada = "山田"
