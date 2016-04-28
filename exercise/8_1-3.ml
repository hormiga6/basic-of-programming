type book_t = {title:string; author:string; publisher:string; price:int; isbn:int;}
let book_1 = {title="ニッポンの個人情報"; author="山本一郎、高木浩光、鈴木正朝"; publisher="翔泳社"; price=1944; isbn=4798139769;}
let book_2 = {title="プログラミングの基礎 "; author="浅井 健一"; publisher="サイエンス社"; price=2300; isbn=4781911609;}
let book_3 = {title="すごいHaskellたのしく学ぼう!"; author="Miran Lipovača"; publisher="オーム社"; price=3024; isbn=4274068854;}

type okozukai_t = {name:string; price:int; place:string; date:string}
let okazukai_rec1 = {name="ペン"; price=110; place="セブンイレブン"; date="2016-04-28"}
let okazukai_rec2 = {name="幕内弁当"; price=550; place="イトーヨーカドー"; date="2016-04-27"}
let okazukai_rec3 = {name="あんぱん"; price=100; place="セブンイレブン"; date="2016-04-26"}

type person_t = {name:string; height:float; weight:float; date_of_bairth:string}
let person1 = {name="山田"; height=175.0; weight=71.;date_of_bairth="1975-01-01"}
let person2 = {name="岩城"; height=185.0; weight=102.;date_of_bairth="1975-02-03"}
let person3 = {name="殿間"; height=168.0; weight=65.;date_of_bairth="1975-02-04"}