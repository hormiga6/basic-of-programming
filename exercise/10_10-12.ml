#use "metro.ml"

(* 目的: ローマ字の駅名と駅名リストを受け取ったら、その駅の漢字表記を文字列で返す*)
(* romaji_to_kanji: string -> ekimei_t list -> string *)
let rec romaji_to_kanji ekimei ekimei_list = match ekimei_list with
	| [] -> ""
	| {kanji=v_kanji; kana=v_kana; romaji=v_romaji; shozoku=v_shozoku}::rest ->
		if ekimei = v_romaji then v_kanji else romaji_to_kanji ekimei rest

let t1 = romaji_to_kanji "yoyogiuehara" global_ekimei_list = "代々木上原"
let t2 = romaji_to_kanji "test" global_ekimei_list = ""


(* 目的: 漢字の駅名二つと駅間リストを受け取ったらその二点間の距離を返す。 *)
(* get_ekikan_kyori: string -> string -> ekikan_t list -> float *)
let rec get_ekikan_kyori kanji_ekimei1 kanji_ekimei2 ekikan_list = match ekikan_list with
	| [] -> infinity
	| {kiten=v_kiten; shuten=v_shuten; keiyu=v_keiyu; kyori=v_kyori; jikan=v_jikan}::rest ->
		if (v_kiten = kanji_ekimei1 && v_shuten = kanji_ekimei2)
		|| (v_kiten = kanji_ekimei2 && v_shuten = kanji_ekimei1)
		then v_kyori else get_ekikan_kyori kanji_ekimei1 kanji_ekimei2 rest

let t1 = get_ekikan_kyori "湯島" "根津" global_ekikan_list = 1.2
let t2 = get_ekikan_kyori "根津" "湯島" global_ekikan_list = 1.2
let t3 = get_ekikan_kyori "白金高輪" "和光市" global_ekikan_list = infinity

(* 目的: ローマ字の駅名を二つ受けとったら、その間の距離を調べ、直接繋がっている
場合は「A駅からB駅まではkmです」という文字列を返し、繋がっていない場合は「A駅とB駅は繋がっていません」という文字列を返す。 *)
let kyori_wo_hyouji romaji_ekimei1 romaji_ekimei2 ekimei_list ekikan_list =
	let (kanji_ekimei1, kanji_ekimei2) = ((romaji_to_kanji romaji_ekimei1 ekimei_list), (romaji_to_kanji romaji_ekimei2 ekimei_list)) in
 		if kanji_ekimei1 = ""
 			then romaji_ekimei1 ^ "という駅は存在しません。"
			else if kanji_ekimei2 = ""
					then romaji_ekimei2 ^ "という駅は存在しません。"
					else
						let kyori = get_ekikan_kyori kanji_ekimei1 kanji_ekimei2 ekikan_list in
							if kyori = infinity
								then kanji_ekimei1 ^ "駅と" ^ kanji_ekimei2 ^ "駅は繋がっていません。"
								else kanji_ekimei1 ^ "駅から" ^ kanji_ekimei2 ^ "駅までは" ^ (string_of_float kyori) ^ "kmです。"


let t1 = kyori_wo_hyouji "yoyogiuehara" "yoyogikouen" global_ekimei_list global_ekikan_list
	   = "代々木上原駅から代々木公園駅までは1.kmです。"
let t2 = kyori_wo_hyouji "yoyogiuehara" "wakousi" global_ekimei_list global_ekikan_list
	   = "代々木上原駅と和光市駅は繋がっていません。"
let t3 = kyori_wo_hyouji "yoyogiuehara" "hachioji" global_ekimei_list global_ekikan_list
	   = "hachiojiという駅は存在しません。"
