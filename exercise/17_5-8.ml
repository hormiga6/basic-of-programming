(* 木を表す方 *)
type tree_t =
  Empty
  | Leaf of int
  | Node of tree_t * int * tree_t
(* treeは
  - Empty　空の木、あるいは
  - Leaf(n) 値がnの葉、あるいは
  - Node(t1,n,t2) 左の木がt1、値がn、右の木がt2であるような節(t1とt2が事故参照) *)

(* tree型の木を受け取ったら、葉や説に入っている値を全て2倍にした木を返す *)
let rec tree_double tree = match tree with
  | Empty -> Empty
  | Leaf (n) -> Leaf (n * 2) 
  | Node (t1,n,t2) -> Node(tree_double t1, n * 2, tree_double t2)

let t1 = tree_double (Node(Empty, 2, Leaf(3))) = Node(Empty, 4, Leaf(6))

(* int -> int型の関数fとtree_t型の木を受け取ったら、節や葉に入っている値全てにfを適用した木を返す *)
let rec tree_map tree f = match tree with
  | Empty -> Empty
  | Leaf (n) -> Leaf (f n)
  | Node (t1,n,t2) -> Node ((tree_map t1 f), (f n), (tree_map t2 f))

let t2 = tree_map (Node(Empty, 4, Leaf(6))) (fun x -> x * 2) = Node(Empty, 8, Leaf(12))

(* tree_t型の木を受け取ったら節と葉の合計を返す *)
let rec tree_length tree = match tree with
  | Empty -> 0
  | Leaf (n) -> n
  | Node (t1, n, t2) -> tree_length t1 + n + tree_length t2

let t3 = tree_length (Node(Empty, 4, Leaf(6))) = 10

(* tree型の木を受け取ったら、根から葉、または空の木に至る最長の道に含まれる節の数を返す *)
let rec tree_depth tree = match tree with
  | Empty -> 0
  | Leaf (n) -> 0
  | Node (t1, n, t2) -> 1 + max (tree_depth t1) (tree_depth t2)

let node1 = (Node(Empty, 1, Leaf(6)))
let node2 = (Node(Node (Empty,0,Empty), 4, Leaf(6)))

let t4 = tree_depth (Node (node1, 0, node2)) = 3


