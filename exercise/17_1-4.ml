(* 年号をあわらす型 *)
type nengou_t = Meiji of int
  | Taisho of int
  | Showa of int
  | Heisei of int

let to_seireki nengou = match nengou with
  | Meiji (n) -> n + 1867
  | Taisho (n) -> n + 1911
  | Showa (n) -> n + 1925
  | Heisei (n) -> n + 1988

(* 誕生年と現在の年をnengou_tで受け取ったら年齢を返す *)
let nenrei birth_year current_year =
   (to_seireki current_year) - (to_seireki birth_year)

let t1 = nenrei (Heisei (1)) (Heisei (1)) = 0
let t2 = nenrei (Showa (56)) (Heisei (29)) = 36

(* 1月から12月までをあわらす構成子 *)
type year_t =
  January
  | February
  | March
  | April
  | May of int
  | June of int
  | July of int
  | August of int
  | September of int
  | October of int
November
December



