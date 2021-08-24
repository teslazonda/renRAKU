require 'faker'

puts "Cleaning the DB"


puts "clearing messages"
Message.destroy_all
puts "Messages cleared"

puts "clearing comments"
Comment.destroy_all
puts "Comments cleared"

puts "clearing students"
Student.destroy_all
puts "Students cleared"

puts "clearing the events"
Event.destroy_all
puts "Events cleared"

puts "clearing classes"
Kurasu.destroy_all
puts "Classes cleared"

puts "clearing the users"
User.destroy_all
puts "User cleared"

puts "Creating new users"
sae = User.create!(
  email: "sae@me.com",
  password: 123456,
  name: "Sae",
  teacher: true
)

quill = User.create!(
  email: "quill@me.com",
  password: 123456,
  name: "Quill",
  teacher: false
)

viddy = User.create!(
  email: "viddy@me.com",
  password: 123456,
  name: "Viddy",
  teacher: false
)

kevin = User.create!(
  email: "kevin@me.com",
  password: 123456,
  name: "Kevin",
  teacher: true
)
puts "Users created"

puts "creating classes"
class_one_a = Kurasu.create(
  name: "1-A",
  class_year: 1,
  user_id: sae.id
)

class_one_b = Kurasu.create(
  name: "1-B",
  class_year: 1,
  user_id: sae.id
)

class_two_a = Kurasu.create(
  name: "2-A",
  class_year: 2,
  user_id: sae.id
)

class_two_b = Kurasu.create(
  name: "2-B",
  class_year: 2,
  user_id: sae.id
)
puts "Classes created"

puts "Creating our target student"
ren = Student.create!(
  first_name: "Ren",
  last_name: "Kitano",
  birthday: "2015-08-24",
  student_number: 1,

  kurasu_id: class_one_a.id,

  user_id: sae.id
)

puts "Creating 9 students for class 1-A"
counter = 1
9.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2015-01-01', to: '2015-12-31'),
    student_number: counter,
    kurasu_id: class_one_a.id,
    user_id: sae.id
  )
  puts "Created #{student.id}"
end
puts "students created"

puts "Creating 10 students for class 1-B"
counter = 10
10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2015-01-01', to: '2015-12-31'),
    student_number: counter,
    kurasu_id: class_one_b.id,
    user_id: sae.id
  )
  puts "Created #{student.id}"
end
puts "students created"

puts "Creating 10 students for class 2-A"
counter = 20
10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2014-01-01', to: '2014-12-31'),
    student_number: counter,
    kurasu_id: class_two_a.id,
    user_id: sae.id
  )
  puts "Created #{student.id}"
end
puts "students created"

puts "Creating 10 students for class 2-B"
counter = 30
10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2015-01-01', to: '2015-12-31'),
    student_number: counter,
    kurasu_id: class_two_b.id,
    user_id: sae.id
  )
  puts "Created #{student.id}"
end
puts "students created"

puts "Creating events"
Event.create!(
  title: "Haloween party!",
  date: "2021-10-30 09:00:00",
  content: "On Saturday morning, the school will organize a Halloween party!\nMake sure to come with a costume and some candies for other children.\nThe party will start at 9am and finish at 12pm. Parents and children are more than welcome to stay for lunch on the school premises.\nThe main gate will close at 3pm.",
  kurasu_id: class_one_a.id
)

Event.create!(
  title: "Museum visit",
  date: "2021-9-15 10:00:00",
  content: "On Wednesday the 15th of September, we will bring class 1-A to the dinosaur museum.\nEntrance fees are ¥200, please make sure to prepare the exact amount as well as a lunch box for your child.\nThe bus leaves the school at 10am and we will be back at 2pm.",
  kurasu_id: class_one_a.id
)
puts "Events created"

puts "creating messages"
sleepy = Message.create!(
  title: "Sleepy in class",
  content: "We have noticed that Ren-kun was quite sleepy this morning in class. Is everything alright?",
  student_id: ren.id,
  user_id: sae.id
)
lunch = Message.create!(
  title: "Broken lunch box",
  content: "Today Ren-kun dropped his lunch box when he took it out of his bag.\nThe top is broken, so you will want to get him a new lunch box",
  student_id: ren.id,
  user_id: sae.id
)
puts "Messages created"

puts "creating comments"
Comment.create(
  user_id: viddy.id,
  message_id: sleepy.id,
  title: "roadtrip",
  content: "Yes, sorry about this! Last weekend we went on a roatrip and he went to bed late last night"
)
Comment.create(
  user_id: sae.id,
  message_id: sleepy.id,
  title: "roadtrip",
  content: "Understood! Next time let us know, so we can let him nap longer"
)
Comment.create(
  user_id: viddy.id,
  message_id: lunch.id,
  title: "old lunch box",
  content: "Thank you for letting us know. This was an old lunch box, so we will get a new one this weekend"
)
Comment.create(
  user_id: sae.id,
  message_id: lunch.id,
  title: "old lunch box",
  content: "Thank you!"
)
