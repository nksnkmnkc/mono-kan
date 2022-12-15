# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin.Mdel
Admin.create!(
    email: 'gim@gim.com',
    password: '123456'
)



#Teacher.Model(5)
Teacher.create!(
  [
    {
        name: '□橋 ○太',
        email: 'i@i',
        grade: '１年',
        subject: '数学',
        club: 'バレーボール部',
        another: '美化委員会',
        password: 'iiiiii',
    },
    {
        name: '△山 □子',
        email: 'u@u',
        grade: '２年',
        subject: '理科',
        club: '科学部',
        another: '給食委員会',
        password: 'uuuuuu',
    },
    {
        name: '●村 ▲人',
        email: 'e@e',
        grade: '３年',
        subject: '社会',
        club: 'テニス部',
        another: '生徒会',
        password: 'eeeeee',
    },
    {
        name: '■倉 ◯樹',
        email: 'o@o',
        grade: '３年',
        subject: '体育',
        club: 'サッカー部',
        another: '体育委員会',
        password: 'oooooo',
    },
    {
        name: '▲藤 □',
        email: 'i@u',
        grade: '２年',
        subject: '英語',
        club: '手芸部',
        another: '放送委員会',
        password: 'iuiuiu',
    }
  ]
)


#Genre.Model(5)
Genre.create!(
  [
    {
        name: '筆記用品'
    },
    {
        name: '紙製品'
    },
    {
        name: '画材・工作用品'
    },
    {
        name: '整理用品'
    },
    {
        name: 'その他'
    }
  ]
)

#Item.Model(15)
item = Item.create(
        genre_id: 1,
        name: "ノック式ボールペン",
        memo: "インク色：黒　0.5mm")
item.image.attach(io: File.open(Rails.root.join("app/assets/images/ballpen.jpg")), filename: "ballpen.jpg")

item2 = Item.create(
        id: 2,
        genre_id: 1,
        name: "消しゴム",
        memo: "01サイズ")
item2.image.attach(io: File.open(Rails.root.join("app/assets/images/keshigomu.jpg")), filename: "keshigomu.jpg")

item3 = Item.create(
        id: 3,
        genre_id: 1,
        name: "えんぴつ",
        memo: "HB")
item3.image.attach(io: File.open(Rails.root.join("app/assets/images/enpitsu.jpg")), filename: "enpitsu.jpg")

item4 = Item.create!(
        id: 4,
        genre_id: 2,
        name: "色画用紙",
        memo: "８ツ切　100枚　色：藍")
item4.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")

item5 = Item.create(
        id: 5,
        genre_id: 2,
        name: "色画用紙",
        memo: "８ツ切　100枚　色：桃")
item5.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")

item6 = Item.create(
        id: 6,
        genre_id: 2,
        name: "色画用紙",
        memo: "８ツ切　100枚　色：緑")
item6.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")

item7 = Item.create(
        id: 7,
        genre_id: 3,
        name: "単色おりがみ",
        memo: "20枚　色：きみどり",)
item7.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")

item8 = Item.create(
        id: 8,
        genre_id: 3,
        name: "単色おりがみ",
        memo: "20枚　色：みずいろ")
item8.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")

item9 = Item.create(
        id: 9,
        genre_id: 3,
        name: "単色おりがみ",
        memo: "20枚　色：ふじ")
item9.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")

item10 = Item.create(
        id: 10,
        genre_id: 4,
        name: "フラットファイル",
        memo: "A4　1冊　色：黄")
item10.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")

item11 = Item.create(
        id: 11,
        genre_id: 4,
        name: "フラットファイル",
        memo: "A4　1冊　色：ピンク")
item11.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")

item12 = Item.create(
        id: 12,
        genre_id: 4,
        name: "フラットファイル",
        memo: "A4　1冊　色：緑")
item12.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")

item13 = Item.create!(
        id: 13,
        genre_id: 5,
        name: "テプラテープ",
        memo: "9mm　白に黒文字")
item13.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")

item14 = Item.create(
        id: 14,
        genre_id: 5,
        name: "テプラテープ",
        memo: "12mm　白に黒文字")
item14.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")

item15 = Item.create(
        id: 15,
        genre_id: 5,
        name: "スズランテープ",
        memo: "470m　色：若草")
item15.image.attach(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")), filename: "no_image.jpg")