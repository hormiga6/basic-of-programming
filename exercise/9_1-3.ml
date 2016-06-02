#use "8_1-4.ml"

let seasons1 = "春"::"夏"::"秋"::"冬"::[]
let persons1 = person1::person2::person3::[]

let seasons2 = ["春";"夏";"秋";"冬"]
let persons2 = [person1;person2;person3]

let t1 = seasons1 = seasons2
let t2 = persons1 = persons2
