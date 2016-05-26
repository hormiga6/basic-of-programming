(* 目的: 駅間のデータ *)
type eikikan_t = {
	kiten:string; (* 起点駅名 *)
	shuten:string; (* 終点鋭気名 *)
	keiyu:string; (* 経由駅名 *)
	kyori:float; (* 距離 *)
	jikan:int; (* 所要時間 *)
}
