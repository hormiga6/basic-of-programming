#use "12_1-3.ml"

type gakusei_t = {
	name: string;
	tensuu: int;
	seiseki: string;
}

(* 目的: 学生リストlstのうち成績がseiseki0の人の数を返す。 *)
let count lst seiseki0 =
	let check_seiseki target_seiseki gakusei  =
		let { name=name;tensuu=tensuu;seiseki=seiseki;} = gakusei in
		target_seiseki = seiseki in
	List.length (List.filter (check_seiseki seiseki0) lst)

let t1 = count [
		{ name="a";tensuu=90;seiseki="A";};
		{ name="b";tensuu=90;seiseki="A";};
		{ name="c";tensuu=0;seiseki="B";};
		] "A" = 2

(* 直前に確定した駅qと未確定の駅のリストvを受け取ったら、必要な更新処理を行った後の未確定の駅のリストを返す *)
let koushin q v =
	let koushin1 p q =
		let {nammae=p_namae;saitankyori=p_saitankyori;temae_list=p_temae_list;} = p in
		let {nammae=q_namae;saitankyori=q_saitankyori;temae_list=q_temae_list;} = q in
		let rec connected nammae_1 nammae_2 ekikan_list = match ekikan_list with
			| [] -> infinity
			| {kiten=kiten; shuten=shuten; keiyu=keiyu; kyori=kyori; jikan=jikan}::rest ->
				if (kiten = nammae_1 && shuten = nammae_2) || (kiten = nammae_2 && shuten = nammae_1)
					then kyori else connected nammae_1 nammae_2 rest in
		let kyori = connected p_namae q_namae global_ekikan_list in
		if  kyori != infinity
			then if p_saitankyori < q_saitankyori
					then {nammae=q_namae;saitankyori=kyori +. p_saitankyori;temae_list=q_namae::p_temae_list;}
					else q
			else q in
	List.map (koushin1 q) v

let t1 = koushin
			{nammae="代々木公園"; saitankyori=1.0; temae_list=["代々木公園"; "代々木上原"];}
			[{nammae="明治神宮前"; saitankyori=infinity; temae_list=[];};
 			 {nammae="大手町"; saitankyori=infinity; temae_list=[];}]
 		= 	[{nammae="明治神宮前"; saitankyori=2.2; temae_list=["明治神宮前";"代々木公園"; "代々木上原"];};
 			 {nammae="大手町"; saitankyori=infinity; temae_list=[];}]
