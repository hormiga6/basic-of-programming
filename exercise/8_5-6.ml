(* 目的: 駅のデータ *)
type eikimei_t = {
	kanji:string; (* 漢字駅名 *)
	kana:string; (* ひらがな駅名 *)
	romaji:string; (* ローマ字駅名 *)
	shozoku:string; (* 路線名 *)
}

(* 目的: ekimei_tを受け取ったら、「路線名、駅名(かな)」の形式の文字列を返す*)
let hyoji ekimei = match ekimei with
 {kanji=kanji; kana=kana; romaji=romaji; shozoku=shozoku; } -> shozoku ^ "、" ^ kanji ^ "(" ^ kana ^ ")"

let t1 = hyoji {kanji="渋谷";kana="しぶや";romaji="Shibuya";shozoku="山手線";}
	= "山手線、渋谷(しぶや)"