#use "14_11-13.ml"

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

let t1 = min_kyori_eki [
    {nammae="明治神宮前"; saitankyori=2.2; temae_list=[];};
    {nammae="大手町"; saitankyori=infinity; temae_list=[];};
    {nammae="九段下"; saitankyori=1.; temae_list=[];};
    {nammae="赤坂"; saitankyori=3.; temae_list=[];};
  ] = {nammae="九段下"; saitankyori=1.; temae_list=[];}

let remove eki list =
  let {nammae=t_nammae; saitankyori=t_saitankyori; temae_list=t_temae_list;} = eki in
  List.filter (fun x ->
    let {nammae=x_nammae; saitankyori=x_saitankyori; temae_list=x_temae_list;} = x in
    x_nammae <> t_nammae
  ) list

let t1 = remove {nammae="九段下"; saitankyori=1.; temae_list=[];} [
    {nammae="明治神宮前"; saitankyori=2.2; temae_list=[];};
    {nammae="大手町"; saitankyori=infinity; temae_list=[];};
    {nammae="九段下"; saitankyori=1.; temae_list=[];};
    {nammae="赤坂"; saitankyori=3.; temae_list=[];};
  ] = [
    {nammae="明治神宮前"; saitankyori=2.2; temae_list=[];};
    {nammae="大手町"; saitankyori=infinity; temae_list=[];};
    {nammae="赤坂"; saitankyori=3.; temae_list=[];};
  ]

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
