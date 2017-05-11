#use "metro.ml"

(* 目的: ダイクストラアルゴリズム用の頂点(駅) *)
type eki_t = {
	nammae: string;
	saitankyori: float;
	temae_list: string list ;
}

let rec get_ekikan_kyori kanji_ekimei1 kanji_ekimei2 ekikan_list = match ekikan_list with
	| [] -> infinity
	| {kiten=v_kiten; shuten=v_shuten; keiyu=v_keiyu; kyori=v_kyori; jikan=v_jikan}::rest ->
		if (v_kiten = kanji_ekimei1 && v_shuten = kanji_ekimei2)
		|| (v_kiten = kanji_ekimei2 && v_shuten = kanji_ekimei1)
		then v_kyori else get_ekikan_kyori kanji_ekimei1 kanji_ekimei2 rest

let t1 = get_ekikan_kyori "湯島" "根津" global_ekikan_list = 1.2
let t2 = get_ekikan_kyori "根津" "湯島" global_ekikan_list = 1.2
let t3 = get_ekikan_kyori "白金高輪" "和光市" global_ekikan_list = infinity


(* 直前に確定した駅p(eki_t型)と未確定の駅のリストv(eki_t list型)を受け取ったら、必要な更新処理を行った後の未確定の駅のリストを返す *)
let koushin p v ekikan_list =
	let {nammae=kakutei_namae;saitankyori=kakutei_saitankyori;temae_list=kakutei_temae_list;} = p in
 	List.map (fun mikakuteki ->
		let {nammae=mikakuteki_namae;saitankyori=mikakuteki_saitankyori;temae_list=mikakuteki_temae_list;} = mikakuteki in
		let kyori = get_ekikan_kyori kakutei_namae mikakuteki_namae ekikan_list in
		if (kakutei_saitankyori +. kyori) < mikakuteki_saitankyori
		then {nammae=mikakuteki_namae;saitankyori=kakutei_saitankyori +. kyori;temae_list=mikakuteki_namae::kakutei_temae_list;}
		else mikakuteki
	) v

let t1 = koushin
		{nammae="代々木公園"; saitankyori=1.0; temae_list=["代々木公園"; "代々木上原"];}
		[{nammae="明治神宮前"; saitankyori=infinity; temae_list=[];};
		 {nammae="大手町"; saitankyori=infinity; temae_list=[];}]
    global_ekikan_list
	= 	[{nammae="明治神宮前"; saitankyori=2.2; temae_list=["明治神宮前";"代々木公園"; "代々木上原"];};
		 {nammae="大手町"; saitankyori=infinity; temae_list=[];}]

let min_kyori_eki min_list =
  List.fold_right
    (fun x acc ->
      let {
        nammae=x_nammae;
        saitankyori=x_saitankyori;
        temae_list=x_temae_list;
      } = x in
      let {
        nammae=acc_nammae;
        saitankyori=acc_saitankyori;
        temae_list=acc_temae_list;
      } = acc in
      if acc_saitankyori < x_saitankyori then acc
      else x )
    min_list
    {
      nammae="";
      saitankyori=infinity;
      temae_list=[];
    }

let remove eki list =
  let {nammae=t_nammae; saitankyori=t_saitankyori; temae_list=t_temae_list;} = eki in
  List.filter (fun x ->
    let {nammae=x_nammae; saitankyori=x_saitankyori; temae_list=x_temae_list;} = x in
    x_nammae <> t_nammae
  ) list

(* eki_t list型のリストを受け取ったら、「最短距離最小の駅」と「最短距離最小の駅以外からなるリスト」の組みを返す関数 *)
let saitan_wo_bunri list =
  let min = min_kyori_eki list in
  let list_wo_min = remove min list in
  (min, list_wo_min)

let t1 = saitan_wo_bunri [
    {nammae="明治神宮前"; saitankyori=2.2; temae_list=[];};
    {nammae="大手町"; saitankyori=infinity; temae_list=[];};
    {nammae="九段下"; saitankyori=1.; temae_list=[];};
    {nammae="赤坂"; saitankyori=3.; temae_list=[];};
  ] = (
    {nammae="九段下"; saitankyori=1.; temae_list=[];},
    [
      {nammae="明治神宮前"; saitankyori=2.2; temae_list=[];};
      {nammae="大手町"; saitankyori=infinity; temae_list=[];};
      {nammae="赤坂"; saitankyori=3.; temae_list=[];};])

(* 未確定の駅のリストと駅間のリストを受け取ったら、各駅についての各駅についての最短距離と最短経路が正しく入ったリストを返す *)
let update_eki eki_list ekikan_list =
  let (eki, list) = saitan_wo_bunri eki_list in
  let updated_eki_list =  koushin eki list ekikan_list in
  ()

let rec dijkstra_main eki_list ekikan_list fixed_eki_list  =
  if eki_list = []
  then fixed_eki_list
  else
    let (fixed_eki, remain_eki_list) = saitan_wo_bunri eki_list in
    let updated_eki_list = koushin fixed_eki remain_eki_list ekikan_list in
    dijkstra_main updated_eki_list ekikan_list (fixed_eki::fixed_eki_list)


let fixture_eki_list =
  [
  {nammae="表参道"; saitankyori=0.; temae_list=["表参道"];};
  {nammae="外苑前"; saitankyori=infinity; temae_list=[];};
  {nammae="青山一丁目"; saitankyori=infinity; temae_list=[];};
  {nammae="赤坂見附"; saitankyori=infinity; temae_list=[];};
  {nammae="国会議事堂前"; saitankyori=infinity; temae_list=[];};
  {nammae="乃木坂"; saitankyori=infinity; temae_list=[];};
  {nammae="赤坂"; saitankyori=infinity; temae_list=[];};
  ]

let t1 = dijkstra_main fixture_eki_list global_ekikan_list []



