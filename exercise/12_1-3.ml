#use "metro.ml"

(* 目的: ダイクストラアルゴリズム用の頂点(駅) *)
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

(* 目的:
	saitan_kyori: 0
	temae_list: 始点の駅名のみからなるリスト
   eki_tのリストと起点(漢字の文字列)を受け取ったら、上記のようになっているeki_t型のリストを返す *)
let rec shokika list kanji = match list with
	| [] -> []
	| ({nammae=nammae; saitankyori=saitankyori; temae_list=temae_list;} as first)::rest ->
		if nammae = kanji then {nammae=nammae; saitankyori=0.; temae_list=[nammae];} :: (shokika rest kanji)
		else first :: (shokika rest kanji)

let t1 = shokika [
	{nammae="代々木上原"; saitankyori=infinity; temae_list=[];};
	{nammae="代々木公園"; saitankyori=infinity; temae_list=[];};
	{nammae="明治神宮前"; saitankyori=infinity; temae_list=[];};
	] "明治神宮前" =
	[
	{nammae="代々木上原"; saitankyori=infinity; temae_list=[];};
	{nammae="代々木公園"; saitankyori=infinity; temae_list=[];};
	{nammae="明治神宮前"; saitankyori=0.; temae_list=["明治神宮前"];};
	]

let t2 = shokika [
	{nammae="代々木上原"; saitankyori=infinity; temae_list=[];};
	{nammae="代々木公園"; saitankyori=infinity; temae_list=[];};
	{nammae="明治神宮前"; saitankyori=infinity; temae_list=[];};
	] "代々木上原" =
	[
	{nammae="代々木上原"; saitankyori=0.; temae_list=["代々木上原"];};
	{nammae="代々木公園"; saitankyori=infinity; temae_list=[];};
	{nammae="明治神宮前"; saitankyori=infinity; temae_list=[];};
	]
