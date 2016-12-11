#use "metro.ml"
#use "10_1-2.ml"

let rec insert ekimei_list ekimei = match ekimei_list with
	| [] -> [ekimei]
	| ({kanji=kanji_list; kana=kana_list; romaji=romaji_list; shozoku=shozoku_list;} as first)::rest ->
		let {kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku;} = ekimei in
			if kana < kana_list then ekimei :: ekimei_list
				else first :: (insert rest ekimei)
let t1 = insert [
		{kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"};
		{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
		{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
		{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
		]
		{kanji="新御茶ノ水"; kana="しんおちゃのみず"; romaji="shin-ochanomizu"; shozoku="千代田線"}
		= [
		{kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"};
		{kanji="新御茶ノ水"; kana="しんおちゃのみず"; romaji="shin-ochanomizu"; shozoku="千代田線"};
		{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
		{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
		{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
		]

let rec insert_sort ekimei_list = match ekimei_list with
	| [] -> []
	| first::last -> insert (insert_sort last) first

let t2 = insert_sort [
		{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
		{kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"};
		{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
		{kanji="新御茶ノ水"; kana="しんおちゃのみず"; romaji="shin-ochanomizu"; shozoku="千代田線"};
		{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
		]
		= [
		{kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"};
		{kanji="新御茶ノ水"; kana="しんおちゃのみず"; romaji="shin-ochanomizu"; shozoku="千代田線"};
		{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
		{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
		{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
		]

let rec delete_duplicate sorted_list ekimei = match sorted_list with
	| [] -> []
	|  ({kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku;} as first)::rest ->
		let {kanji=prev_kanji; kana=prev_kana; romaji=prev_romaji; shozoku=prev_shozoku;} = ekimei in
			if kana = prev_kana then delete_duplicate rest first
				else first :: (delete_duplicate rest first)

let t3 = delete_duplicate [
		{kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"};
		{kanji="新御茶ノ水"; kana="しんおちゃのみず"; romaji="shin-ochanomizu"; shozoku="千代田線"};
		{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
		{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
		{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
		{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
		] {kanji=""; kana=""; romaji=""; shozoku=""}
		= [
		{kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"};
		{kanji="新御茶ノ水"; kana="しんおちゃのみず"; romaji="shin-ochanomizu"; shozoku="千代田線"};
		{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
		{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
		{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
		]
