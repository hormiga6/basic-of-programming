type book_t = {title:string; author:string; publisher:string; price:int; isbn:int;}
let book_1 = {title="ニッポンの個人情報"; author="山本一郎、高木浩光、鈴木正朝"; publisher="翔泳社"; price=1944; isbn=4798139769;}
let book_2 = {title="プログラミングの基礎 "; author="浅井 健一"; publisher="サイエンス社"; price=2300; isbn=4781911609;}
let book_3 = {title="すごいHaskellたのしく学ぼう!"; author="Miran Lipovača"; publisher="オーム社"; price=3024; isbn=4274068854;}

type okozukai_t = {name:string; price:int; place:string; date:string}
let okazukai_rec1 = {name="ペン"; price=110; place="セブンイレブン"; date="2016-04-28"}
let okazukai_rec2 = {name="幕内弁当"; price=550; place="イトーヨーカドー"; date="2016-04-27"}
let okazukai_rec3 = {name="あんぱん"; price=100; place="セブンイレブン"; date="2016-04-26"}

(* 目的: 個人のデータ *)
type person_t = {
	name:string; (* 名前 *)
	height:float; (* 身長 *)
	weight:float; (* 体重 *)
	month:int; (* 月 *)
	day:int; (* 日 *)
	blood_type:string; (* 血液型 *)
}
let person1 = {name="山田"; height=1.75; weight=71.; month=1; day=21; blood_type="A"}
let person2 = {name="岩城"; height=1.85; weight=102.; month=2; day=22; blood_type="B"}
let person3 = {name="殿間"; height=1.68; weight=65.; month=3; day=23; blood_type="A"}

(* 目的: person_t型のデータを受け取ったら、「〜さんの血液型は*型です」という型の文字列を返す。 *)
(* ketsueki_hyoji : person_t -> string *)
let ketsueki_hyoji person = match person with
	| {name=name; height=height; weight=weight; month=month; day=day; blood_type=blood_type}
	-> name ^ "さんの血液型は" ^ blood_type ^ "型です"

let t1 = ketsueki_hyoji person1 = "山田さんの血液型はA型です"
let t2 = ketsueki_hyoji person2 = "岩城さんの血液型はB型です"
