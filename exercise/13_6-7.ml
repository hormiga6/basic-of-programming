#use "12_1-3.ml"

(* 駅が繋がっている場合はtrueを返す*)
let rec connected nammae_1 nammae_2 ekikan_list = match ekikan_list with
	| [] -> infinity
	| {kiten=kiten; shuten=shuten; keiyu=keiyu; kyori=kyori; jikan=jikan}::rest ->
		if (kiten = nammae_1 && shuten = nammae_2) || (kiten = nammae_2 && shuten = nammae_1)
			then kyori else connected nammae_1 nammae_2 rest

let t1 = connected "乃木坂" "赤坂" global_ekikan_list = 1.1
let t2 = connected "赤坂" "乃木坂" global_ekikan_list = 1.1
let t3 = connected "赤坂" "代々木上原" global_ekikan_list = infinity


(* 直前に確定した駅pと未確定の駅qを受け取ったらpとqが繋がっているか調べ、繋がっていたらqの最短距離と手前リストを必要に応じて更新したもの、
繋がっていなかったらqをそのまま返す *)
let koushin1 p q =
	let {nammae=p_namae;saitankyori=p_saitankyori;temae_list=p_temae_list;} = p in
	let {nammae=q_namae;saitankyori=q_saitankyori;temae_list=q_temae_list;} = q in
	let kyori = connected p_namae q_namae global_ekikan_list in
	if  kyori != infinity
		then if p_saitankyori < q_saitankyori
				then {nammae=q_namae;saitankyori=kyori +. p_saitankyori;temae_list=q_namae::p_temae_list;}
				else q
		else q

(* 開始点: 代々木上原
   確定点: 代々木公園
 *)
let t1 = koushin1
			{nammae="代々木公園"; saitankyori=1.0; temae_list=["代々木公園"; "代々木上原"];}
			{nammae="明治神宮前"; saitankyori=infinity; temae_list=[];}
		= {nammae="明治神宮前"; saitankyori=2.2; temae_list=["明治神宮前";"代々木公園"; "代々木上原"];}

let t2 = koushin1
			{nammae="代々木公園"; saitankyori=1.0; temae_list=["代々木公園"; "代々木上原"];}
			{nammae="大手町"; saitankyori=infinity; temae_list=[];}
		= {nammae="大手町"; saitankyori=infinity; temae_list=[];}

(* 直前に確定した駅qと未確定の駅のリストvを受け取ったら、必要な更新処理を行った後の未確定の駅のリストを返す *)
let koushin q v = List.map (koushin1 q) v

let t1 = koushin
			{nammae="代々木公園"; saitankyori=1.0; temae_list=["代々木公園"; "代々木上原"];}
			[{nammae="明治神宮前"; saitankyori=infinity; temae_list=[];};
 			 {nammae="大手町"; saitankyori=infinity; temae_list=[];}]
 		= 	[{nammae="明治神宮前"; saitankyori=2.2; temae_list=["明治神宮前";"代々木公園"; "代々木上原"];};
 			 {nammae="大手町"; saitankyori=infinity; temae_list=[];}]
