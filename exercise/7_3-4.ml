(* x座標とy座標の組で表された平面座標を受け取ったら、x軸について対象な点を返す *)
let taisho_x points = match points with
	| (x, y) -> (x, -.y)

let t1 = taisho_x (1., 10.) = (1., -10.)
let t2 = taisho_x (0., 0.) = (0., 0.)

(* x座標とy座標の組で表された平面座標を二つ受け取ったら、その中点の座標を返す *)
let chuten points1 points2 = match points1 with
	| (x1,y1) -> match points2 with
		| (x2,y2) -> ((x1 +. x2) /. 2., (y1 +. y2) /. 2.)

let t1 = chuten (1., 10.0) (1.0, 10.0) = (1., 10.)
let t2 = chuten (5., 2.) (-3., 202.) = (1., 102.)
let t3 = chuten (0., 0.) (0., 0.) = (0., 0.)
