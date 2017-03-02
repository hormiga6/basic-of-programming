#use "metro.ml"

(* 目的: ダイクストラアルゴリズム用の頂点(駅) *)
type eki_t = {
	nammae: string;
	saitankyori: float;
	temae_list: string list ;
}

(* 目的: ekimei_t型のリストを受け取ったら、その駅名を使ってeki_t型のリストを作る *)
let rec make_eki_list eikmei_list =
	List.map (fun ekimei -> match ekimei with
		| {kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku} -> {nammae=kanji; saitankyori=infinity; temae_list=[];})
		eikmei_list

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
	{saitan_kyori: 0
 	temae_list: 始点の駅名のみからなるリスト}
   eki_tのリストと起点(漢字の文字列)を受け取ったら、上記のようになっているeki_t型のリストを返す *)
let shokika list kanji =
	List.map (fun eki -> match eki with
		| {nammae=nammae; saitankyori=saitankyori; temae_list=temae_list;} ->
			if nammae = kanji
			then {nammae=nammae; saitankyori=0.; temae_list=[nammae];}
			else eki
		) list

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

(* 目的: ekimei_t型のリストと起点(漢字)を受け取ったら、eki_tのリストを返す。また起点は以下に初期化する。
	{ saitan_kyori: 0
 	  temae_list: 始点の駅名のみからなるリスト
 	}
*)
let make_initial_eki_list ekimei_list kiten =
	List.map (fun ekimei -> match ekimei with
	| {kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku} ->
		if kanji = kiten then {nammae=kanji; saitankyori=0.; temae_list=[kanji];}
		else {nammae=kanji; saitankyori=infinity; temae_list=[];}
	) ekimei_list

let t1 = make_initial_eki_list [
	{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
	{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
	{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
	] "明治神宮前" =
	[
	{nammae="代々木上原"; saitankyori=infinity; temae_list=[];};
	{nammae="代々木公園"; saitankyori=infinity; temae_list=[];};
	{nammae="明治神宮前"; saitankyori=0.; temae_list=["明治神宮前"];};
	]

let t2 = make_initial_eki_list [
	{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
	{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
	{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
	] "代々木上原" =
	[
	{nammae="代々木上原"; saitankyori=0.; temae_list=["代々木上原"];};
	{nammae="代々木公園"; saitankyori=infinity; temae_list=[];};
	{nammae="明治神宮前"; saitankyori=infinity; temae_list=[];};
	]

(* 直前に確定した駅p(eki_t型)と未確定の駅のリストv(eki_t list型)を受け取ったら、必要な更新処理を行った後の未確定の駅のリストを返す *)
let koushin p v =
	let {nammae=kakutei_namae;saitankyori=kakutei_saitankyori;temae_list=kakutei_temae_list;} = p in
 	List.map (fun mikakuteki ->
		let {nammae=mikakuteki_namae;saitankyori=mikakuteki_saitankyori;temae_list=mikakuteki_temae_list;} = mikakuteki in
		let rec connected nammae_1 nammae_2 ekikan_list = match ekikan_list with
					| [] -> infinity
					| {kiten=kiten; shuten=shuten; keiyu=keiyu; kyori=kyori; jikan=jikan}::rest ->
						if (kiten = nammae_1 && shuten = nammae_2) || (kiten = nammae_2 && shuten = nammae_1)
							then kyori else connected nammae_1 nammae_2 rest in
		let kyori = connected kakutei_namae mikakuteki_namae global_ekikan_list in
		if  kyori != infinity
			then if (kakutei_saitankyori +. kyori) < mikakuteki_saitankyori
					then {nammae=mikakuteki_namae;saitankyori=kakutei_saitankyori +. kyori;temae_list=mikakuteki_namae::kakutei_temae_list;}
					else mikakuteki
			else mikakuteki
	) v

let t1 = koushin
			{nammae="代々木公園"; saitankyori=1.0; temae_list=["代々木公園"; "代々木上原"];}
			[{nammae="明治神宮前"; saitankyori=infinity; temae_list=[];};
 			 {nammae="大手町"; saitankyori=infinity; temae_list=[];}]
 		= 	[{nammae="明治神宮前"; saitankyori=2.2; temae_list=["明治神宮前";"代々木公園"; "代々木上原"];};
 			 {nammae="大手町"; saitankyori=infinity; temae_list=[];}]
