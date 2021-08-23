puts "Cleaning the DB"

puts "clearing the users"
User.destroy_all
puts "User cleared"

puts "clearing students"
Student.destroy_all
puts "Students cleared"

puts "clearing classes"
Kurasu.destroy_all
puts "Classes cleared"

sae = User.create!(
  email: "sae@me.com",
  password: 123456,
  name: "Sae",
  type: true
)

quill = User.create!(
  email: "quill@me.com",
  password: 123456,
  name: "Quill",
  type: false
)

viddy = User.create!(
  email: "viddy@me.com",
  password: 123456,
  name: "Viddy",
  type: false
)

kevin = User.create!(
  email: "kevin@me.com",
  password: 123456,
  name: "Kevin",
  type: true
)

classonea = Kurasu.create(
  name: "1-A",
  class_year: 1,
  user_id: sae.id
)

classoneb = Kurasu.create(
  name: "1-B",
  class_year: 1,
  user_id: sae.id
)

classtwoa = Kurasu.create(
  name: "2-A",
  class_year: 2,
  user_id: sae.id
)

classtwob = Kurasu.create(
  name: "2-B",
  class_year: 2,
  user_id: sae.id
)
