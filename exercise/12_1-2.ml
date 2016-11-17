#use "metro.ml"

(* 目的: ダイクストラアウゴリズム用の頂点(駅) *)
type eki_t = {
	nammae: string;
	saitankyori: float;
	temae_list: string list ;
}

(* 目的: ekimei_t型のリストを受け取ったら、その駅名を使ってeiki_t型のリストを作る *)
let rec make_eki_list eikmei_list = match eikmei_list with
	| [] -> []
	| ({kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku})::rest ->
		{nammae=kanji; saitankyori=infinity; temae_list=[];}::make_eki_list rest

let t1 = make_eki_list[
	{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
	{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
	{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};]
	= [
	{nammae="代々木上原"; saitankyori=infinity; temae_list=[];};
	{nammae="代々木公園"; saitankyori=infinity; temae_list=[];};
	{nammae="明治神宮前"; saitankyori=infinity; temae_list=[];};
	]
