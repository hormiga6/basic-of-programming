(* 目的: 個人のデータ *)
type person_t = {
	name:string; (* 名前 *)
	height:float; (* 身長 *)
	weight:float; (* 体重 *)
	month:int; (* 月 *)
	day:int; (* 日 *)
	blood_type:string; (* 血液型 *)
}

(* person_t list は
	- []          空リスト
	- first::rest 最初の要素がfirstで残りのリストがrest
	              fistはperson_t型、restは自己参照型
	          *)

let person1 = {name="森"; height=1.75; weight=71.; month=8; day=22; blood_type="A"}
let person2 = {name="夏目"; height=1.85; weight=102.; month=8; day=23; blood_type="B"}
let person3 = {name="谷崎"; height=1.68; weight=65.; month=9; day=22; blood_type="AB"}
let person4 = {name="永井"; height=1.68; weight=65.; month=9; day=23; blood_type="A"}
let person5 = {name="三島"; height=1.68; weight=65.; month=3; day=23; blood_type="O"}
let list1 = [person1; person2;person3;person4;person5]

(* 目的: person_tのリストを受け取ったら、血液型がA型の人を返す関数 *)
let rec count_ketsueki_A list = match list with
	  [] -> []
	| ({name=name; height=height; weight=weight; month=month; day=day; blood_type=blood_type} as first)::rest ->
		if blood_type = "A" then first :: count_ketsueki_A rest
		else count_ketsueki_A rest

let t1 = count_ketsueki_A list1 = [person1; person4]
let t2 = count_ketsueki_A [person2; person3] = []

(* 乙女座が判定する *)
let is_otomeza person = match person with
	| {name=name; height=height; weight=weight; month=month; day=day; blood_type=blood_type} ->
		 823 <= ((month * 100) + day ) && ((month * 100) + day ) <= 922

let t1 = is_otomeza person1 = false
let t2 = is_otomeza person2 = true
let t3 = is_otomeza person3 = true
let t4 = is_otomeza person4 = false

(* 目的: person_t型のリストを受け取ったら、乙女座の人の名前のみからなるリスト返す *)
let rec otomeza list = match list with
	| [] -> []
	|  ({name=name; height=height; weight=weight; month=month; day=day; blood_type=blood_type} as first)::rest ->
		if is_otomeza first then name::otomeza rest
		else otomeza rest

let t1 = otomeza [person1;person2;person3;person4;] = ["夏目";"谷崎";]
let t2 = otomeza [] = []
