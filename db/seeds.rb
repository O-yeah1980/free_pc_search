# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

es = Department.create(name: "電子システム部")
es_1 = es.children.create(name: "第１電子システム室")
es_1.children.create([{ name: "１グループ" }, { name: "２グループ" }, { name: "３グループ" }])
es_2 = es.children.create(name: "第２電子システム室")
es_2.children.create([{ name: "１グループ" }, { name: "２グループ" }, { name: "３グループ" }])
es_3 = es.children.create(name: "第３電子システム室")
es_3.children.create([{ name: "１グループ" }, { name: "２グループ" }, { name: "３グループ" }])

25.times do |n|
  Computer.create!(
    pc_number: "AB123#{format("%03d", n + 1)}",
    post_id: rand(1..2),
    special_function: 0,
    use_method: 1,
    department_id: Department.find(2).id,
    user_id: 2
    )
end

10.times do |n|
  Computer.create!(
    pc_number: "AB123#{format("%03d", n + 50)}",
    post_id: rand(1..2),
    special_function: 0,
    use_method: 1,
    department_id: Department.find(6).id,
    user_id: 2
    )
end
  
18.times do |n|
  Computer.create!(
    pc_number: "AB456#{format("%03d", n + 123)}",
    post_id: rand(1..2),
    special_function: 0,
    use_method: 2,
    department_id: Department.find(10).id,
    user_id: 2
    )
end