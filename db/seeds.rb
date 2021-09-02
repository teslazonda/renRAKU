require 'faker'
require 'open-uri'

puts "Cleaning the DB"

# We will have to remove this in order not to have someone inadvertently deleting real entries in production.
puts "clearing grades"
Grade.destroy_all
puts "Grades cleared"
puts "clearing schedules"
Schedule.destroy_all
puts "Schedules cleared"
puts "clearing meetings"
Meeting.destroy_all
puts "Meetings cleared"
puts "clearing messages"
Message.destroy_all
puts "Messages cleared"

puts "clearing comments"
Comment.destroy_all
puts "Comments cleared"

puts "clearing students"
Student.destroy_all
puts "Students cleared"

puts "clearing the participants"
Participant.destroy_all
puts "Participants cleared"

puts "clearing the events"
Event.destroy_all
puts "Events cleared"

puts "clearing classes"
Kurasu.destroy_all
puts "Classes cleared"

puts "clearing the users"
User.destroy_all
puts "User cleared"

puts "Creating admin"
admin = User.create!(
  email: "admin@me.com",
  password: 123456,
  name: "admin",
  teacher: true
)
admin.admin = true
admin.save

puts "Creating new teachers"

sae = User.create!(
  email: "sae@me.com",
  password: 123456,
  name: "Sae-sensei",
  teacher: true
)

kevin = User.create!(
  email: "kevin@me.com",
  password: 123456,
  name: "Kevin-sensei",
  teacher: true
)

doug = User.create!(
  email: "doug@me.com",
  password: 123456,
  name: "Doug-sensei",
  teacher: true
)

trouni = User.create!(
  email: "trouni@me.com",
  password: 123456,
  name: "Trouni-sensei",
  teacher: true
)

yann = User.create!(
  email: "yann@me.com",
  password: 123456,
  name: "Yann-sensei",
  teacher: true
)

noemi = User.create!(
  email: "noemi@me.com",
  password: 123456,
  name: "Noemi-sensei",
  teacher: true
)
puts 'New teachers created'

puts 'Creating new parents'

viddy = User.create!(
  email: "viddy@me.com",
  password: 123456,
  name: "Viddy",
  teacher: false
)

# Creating two extra parents in case we need specific parents for demonstration purposes.
# quill = User.create!(
#   email: "quill@me.com",
#   password: 123456,
#   name: "Quill",
#   teacher: false
# )

# lena = User.create!(
#   email: "lena@me.com",
#   password: 123456,
#   name: "Lena",
#   teacher: false
# )

parents = []
119.times do
  name = Faker::Name.name
  parent = User.create!(
    name: name,
    email: Faker::Internet.email(name: name, separators: '+'),
    password: 123456,
    teacher: false
  )
  parents << parent
end

puts "Parents created"

puts "Creating classes"

year_one = []
class_one_a = Kurasu.create(
  name: "1-A",
  class_year: 1,
  user_id: sae.id
)
# Putting classes in year arrays in case we want to group the classes for displaying purposes.
year_one << class_one_a

class_one_b = Kurasu.create(
  name: "1-B",
  class_year: 1,
  user_id: sae.id
)
year_one << class_one_b

year_two = []
class_two_a = Kurasu.create(
  name: "2-A",
  class_year: 2,
  user_id: kevin.id
)
year_two << class_two_a

class_two_b = Kurasu.create(
  name: "2-B",
  class_year: 2,
  user_id: kevin.id
)
year_two << class_two_b

year_three = []
class_three_a = Kurasu.create(
  name: "3-A",
  class_year: 3,
  user_id: doug.id
)
year_three << class_three_a

class_three_b = Kurasu.create(
  name: "3-B",
  class_year: 3,
  user_id: doug.id
)
year_three << class_three_b

year_four = []
class_four_a = Kurasu.create(
  name: "4-A",
  class_year: 4,
  user_id: trouni.id
)
year_four << class_four_a

class_four_b = Kurasu.create(
  name: "4-B",
  class_year: 4,
  user_id: trouni.id
)
year_four << class_four_b

year_five = []
class_five_a = Kurasu.create(
  name: "5-A",
  class_year: 5,
  user_id: yann.id
)
year_five << class_five_a

class_five_b = Kurasu.create(
  name: "5-B",
  class_year: 5,
  user_id: yann.id
)
year_five << class_five_b

year_six = []
class_six_a = Kurasu.create(
  name: "6-A",
  class_year: 6,
  user_id: noemi.id
)
year_six << class_six_a

class_six_b = Kurasu.create(
  name: "6-B",
  class_year: 6,
  user_id: noemi.id
)
year_six << class_six_b

puts "Classes created"

puts "Creating target student"

ren = Student.create!(
  first_name: "Ren",
  last_name: "Kitano",
  birthday: "2015-08-24",
  student_number: 1,

  kurasu_id: class_one_a.id,

  user_id: viddy.id
)
puts "Giving target student grades"

grade_dates = ['Mon Aug 30 08:10:20 2021 UTC', 'Tue Aug 31 08:55:28 2021 UTC' 'Sun Aug 29 08:44:28 2021 UTC']
grade_subject = ['History', 'Math', 'Social Studies', 'English', 'Japanese']
grade_name = ['Final Exam', 'Midterm', 'Pop quiz', 'Homework']
grade_value = ['A', 'B', 'C']
# 5.times do
#   Grade.create!(
#     date: grade_dates.sample,
#     subject: grade_subject.sample,
#     name: grade_name.sample,
#     value: grade_value.sample,
#     student: ren
#   )
# end

Grade.create!(
  date: 'Mon Jul 30 08:10:20 2021 UTC',
  subject: 'English',
  name: 'Homework',
  value: 'C',
  student: ren
)

Grade.create!(
  date: 'Mon Jul 30 08:10:20 2021 UTC',
  subject: 'English',
  name: 'Pop quiz',
  value: 'C',
  student: ren
)

Grade.create!(
  date: 'Mon Jul 30 08:10:20 2021 UTC',
  subject: 'Math',
  name: 'Homework',
  value: 'A',
  student: ren
)

Grade.create!(
  date: 'Mon Jul 30 08:10:20 2021 UTC',
  subject: 'Math',
  name: 'Pop quiz',
  value: 'A',
  student: ren
)

Grade.create!(
  date: 'Mon Jul 30 08:10:20 2021 UTC',
  subject: 'Social Studies',
  name: 'Homework',
  value: 'A',
  student: ren
)

Grade.create!(
  date: 'Mon Jul 30 08:10:20 2021 UTC',
  subject: 'Social Studies',
  name: 'Homework',
  value: 'B',
  student: ren
)

puts "Creating 9 students for class 1-A"

Student.create!(
  first_name: 'Ayaka',
  last_name: 'Hisamune',
  birthday: Faker::Date.between(from: '2015-01-01', to: '2015-12-31'),
  student_number: 2,
  kurasu_id: class_one_a.id,
  user_id: parents[0].id
)

Student.create!(
  first_name: 'Sakura',
  last_name: 'Nishimura',
  birthday: Faker::Date.between(from: '2015-01-01', to: '2015-12-31'),
  student_number: 3,
  kurasu_id: class_one_a.id,
  user_id: parents[1].id
)

Student.create!(
  first_name: 'Takumi',
  last_name: 'Watanabe',
  birthday: Faker::Date.between(from: '2015-01-01', to: '2015-12-31'),
  student_number: 4,
  kurasu_id: class_one_a.id,
  user_id: parents[2].id
)

Student.create!(
  first_name: 'Gen',
  last_name: 'Hoshino',
  birthday: Faker::Date.between(from: '2015-01-01', to: '2015-12-31'),
  student_number: 5,
  kurasu_id: class_one_a.id,
  user_id: parents[3].id
)

Student.create!(
  first_name: 'Ryo',
  last_name: 'Takahashi',
  birthday: Faker::Date.between(from: '2015-01-01', to: '2015-12-31'),
  student_number: 6,
  kurasu_id: class_one_a.id,
  user_id: parents[4].id
)

Student.create!(
  first_name: 'Jiro',
  last_name: 'Sakai',
  birthday: Faker::Date.between(from: '2015-01-01', to: '2015-12-31'),
  student_number: 7,
  kurasu_id: class_one_a.id,
  user_id: parents[5].id
)

Student.create!(
  first_name: 'Hina',
  last_name: 'Yamagishi',
  birthday: Faker::Date.between(from: '2015-01-01', to: '2015-12-31'),
  student_number: 8,
  kurasu_id: class_one_a.id,
  user_id: parents[6].id
)

Student.create!(
  first_name: 'Shohei',
  last_name: 'Nakamura',
  birthday: Faker::Date.between(from: '2015-01-01', to: '2015-12-31'),
  student_number: 9,
  kurasu_id: class_one_a.id,
  user_id: parents[7].id
)

puts "Created Students in 1-A"


puts "students created"

puts "Creating 10 students for class 1-B"

counter = 10
parent_counter = 8
10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2015-01-01', to: '2015-12-31'),
    student_number: counter,
    kurasu_id: class_one_b.id,
    user_id: parents[parent_counter].id
  )

  5.times do
  Grade.create!(
    date: grade_dates.sample,
    subject: grade_subject.sample,
    name: grade_name.sample,
    value: grade_value.sample,
    student: student
  )
  end
  parent_counter += 1
  puts "Created #{student.id}"
end

puts "Creating 10 students for class 2-A"

# counter = 20
10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2014-01-01', to: '2014-12-31'),
    student_number: counter,
    kurasu_id: class_two_a.id,
    user_id: parents[parent_counter].id
  )

 5.times do
  Grade.create!(
    date: grade_dates.sample,
    subject: grade_subject.sample,
    name: grade_name.sample,
    value: grade_value.sample,
    student: student
  )
  end
  parent_counter += 1
  puts "Created #{student.id}"
end

puts "Creating 10 students for class 2-B"

10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2014-01-01', to: '2014-12-31'),
    student_number: counter,
    kurasu_id: class_two_b.id,
    user_id: parents[parent_counter].id
  )

 5.times do
  Grade.create!(
    date: grade_dates.sample,
    subject: grade_subject.sample,
    name: grade_name.sample,
    value: grade_value.sample,
    student: student
  )
  end
  parent_counter += 1
  puts "Created #{student.id}"
end

puts "students created"

puts "Creating 10 students for class 3-A"

# counter = 30
10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2013-01-01', to: '2013-12-31'),
    student_number: counter,
    kurasu_id: class_three_a.id,
    user_id: parents[parent_counter].id
  )

 5.times do
  Grade.create!(
    date: grade_dates.sample,
    subject: grade_subject.sample,
    name: grade_name.sample,
    value: grade_value.sample,
    student: student
  )
  end
  parent_counter += 1
  puts "Created #{student.id}"
end

puts "Creating 10 students for class 3-B"

10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2013-01-01', to: '2013-12-31'),
    student_number: counter,
    kurasu_id: class_three_b.id,
    user_id: parents[parent_counter].id
  )
 5.times do
  Grade.create!(
    date: grade_dates.sample,
    subject: grade_subject.sample,
    name: grade_name.sample,
    value: grade_value.sample,
    student: student
  )
  end
  parent_counter += 1
  puts "Created #{student.id}"
end

puts "Creating 10 students for class 4-A"

# counter = 30
10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2012-01-01', to: '2012-12-31'),
    student_number: counter,
    kurasu_id: class_four_a.id,
    user_id: parents[parent_counter].id
  )
 5.times do
  Grade.create!(
    date: grade_dates.sample,
    subject: grade_subject.sample,
    name: grade_name.sample,
    value: grade_value.sample,
    student: student
  )
  end

  parent_counter += 1
  puts "Created #{student.id}"
end

puts "Creating 10 students for class 4-B"

10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2012-01-01', to: '2012-12-31'),
    student_number: counter,
    kurasu_id: class_four_b.id,
    user_id: parents[parent_counter].id
  )
 5.times do
  Grade.create!(
    date: grade_dates.sample,
    subject: grade_subject.sample,
    name: grade_name.sample,
    value: grade_value.sample,
    student: student
  )
  end
  parent_counter += 1
  puts "Created #{student.id}"
end

puts "Creating 10 students for class 5-A"

# counter = 30
10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2011-01-01', to: '2011-12-31'),
    student_number: counter,
    kurasu_id: class_five_a.id,
    user_id: parents[parent_counter].id
  )
  5.times do
  Grade.create!(
    date: grade_dates.sample,
    subject: grade_subject.sample,
    name: grade_name.sample,
    value: grade_value.sample,
    student: student
  )
  end
  parent_counter += 1
  puts "Created #{student.id}"
end

puts "Creating 10 students for class 5-B"

10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2011-01-01', to: '2011-12-31'),
    student_number: counter,
    kurasu_id: class_five_b.id,
    user_id: parents[parent_counter].id
  )
  5.times do
  Grade.create!(
    date: grade_dates.sample,
    subject: grade_subject.sample,
    name: grade_name.sample,
    value: grade_value.sample,
    student: student
  )
  end
  parent_counter += 1
  puts "Created #{student.id}"
end

puts "Creating 10 students for class 6-A"

# counter = 30
10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2010-01-01', to: '2010-12-31'),
    student_number: counter,
    kurasu_id: class_six_a.id,
    user_id: parents[parent_counter].id
  )
  5.times do
  Grade.create!(
    date: grade_dates.sample,
    subject: grade_subject.sample,
    name: grade_name.sample,
    value: grade_value.sample,
    student: student
  )
  end
  parent_counter += 1
  puts "Created #{student.id}"
end

puts "Creating 10 students for class 6-B"

10.times do
  counter += 1
  student = Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '2010-01-01', to: '2010-12-31'),
    student_number: counter,
    kurasu_id: class_six_b.id,
    user_id: parents[parent_counter].id
  )
  5.times do
  Grade.create!(
    date: grade_dates.sample,
    subject: grade_subject.sample,
    name: grade_name.sample,
    value: grade_value.sample,
    student: student
  )
  end
  parent_counter += 1
  puts "Created #{student.id}"
end

puts "Students created"

puts "Creating events"

halloween_event = Event.create!(
  title: "Halloween party!",
  date: "2021-10-30 09:00:00",
  rich_body: "On Saturday morning, the school will organize a Halloween party!\nMake sure to come with a costume and some candy for the other children.\nThe party will start at 9:00 and finish at noon. Parents and children are welcome to stay for lunch on the school premises.\nThe main gate will close at 15:00.",
)
file_halloween = URI.open('https://blog.hotelsbyday.com/wp-content/uploads/halloweendaystayfeature-759x500.jpg')
halloween_event.photo.attach(io: file_halloween, filename: 'halloween.jpg', content_type: 'image/jpg')
halloween_event.participants = [Participant.new(kurasu_id: class_one_a.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_one_b.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_two_a.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_two_b.id, event_id: halloween_event.id)]

# Let's put this in after we fix the cards
# [Participant.new(kurasu_id: class_one_a.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_one_b.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_two_a.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_two_b.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_three_a.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_three_b.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_four_a.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_four_b.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_five_a.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_five_b.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_six_a.id, event_id: halloween_event.id), Participant.new(kurasu_id: class_six_b.id, event_id: halloween_event.id)]

museum_event = Event.create!(
  title: "Museum visit",
  date: "2021-9-15 10:00:00",
  rich_body: "On Wednesday the 15th of September, we will bring the first year to the dinosaur museum.\nEntrance fees are ¥200, please make sure to prepare the exact amount as well as a lunch box for your child.\nThe bus leaves the school at 10am and we will be back at 2pm.",
)
file = URI.open('https://d27k8xmh3cuzik.cloudfront.net/wp-content/uploads/2018/10/national-musuem-of-colombo-cover-img.jpg')
museum_event.photo.attach(io: file, filename: 'museum.jpg', content_type: 'image/jpg')
museum_event.participants = [Participant.new(kurasu_id: class_one_a.id, event_id: museum_event.id), Participant.new(kurasu_id: class_one_b.id, event_id: museum_event.id)]

puts "Events created"

puts "creating messages"

sleepy = Message.create!(
  title: "Sleepy in class",
  content: "We have noticed that Ren-kun was quite sleepy this morning in class. Is everything alright?",
  student_id: ren.id,
  user_id: sae.id
)
file_sleepy = URI.open('https://i.ya-webdesign.com/images/sleepy-drawing-pikachu-1.png')
sleepy.photo.attach(io: file_sleepy, filename: 'sleepy.jpg', content_type: 'image/jpg')

lunch = Message.create!(
  title: "Broken lunch box",
  content: "Today Ren-kun dropped his lunch box when he took it out of his bag.\nThe top is broken, so you will want to get him a new lunch box",
  student_id: ren.id,
  user_id: sae.id
)
file_lunch = URI.open('https://3.bp.blogspot.com/-soud9WTrtm0/WPYuy6umw3I/AAAAAAACpZY/SQ7kcZwKCroCGvjQ46nS8yVwAv2Id8O5ACLcB/s1600/vintage-lunch-boxes-20.jpg')
lunch.photo.attach(io: file_lunch, filename: 'lunch.jpg', content_type: 'image/jpg')
puts "Messages created"

puts "creating comments"

Comment.create!(
  user_id: viddy.id,
  message_id: sleepy.id,
  content: "Yes, sorry about this! Last weekend we went on a roatrip and he went to bed late last night"
)
Comment.create!(
  user_id: sae.id,
  message_id: sleepy.id,
  content: "Understood! Next time let us know, so we can let him nap longer"
)
Comment.create!(
  user_id: viddy.id,
  message_id: lunch.id,
  content: "Thank you for letting us know. This was an old lunch box, so we will get a new one this weekend"
)
Comment.create!(
  user_id: sae.id,
  message_id: lunch.id,
  content: "Thank you!"
)

puts "Creating meetings"
Meeting.create!(
  title: "Second semester meeting",
  content: "The second semester has started and we would like to have one-on-one meeting to talk about the progress your children made in the first semester, as well as what to focus on onwards.",
  date: "2021-9-22",
  teacher: sae,
  kurasu: class_one_a,
  hour: 0
)

Meeting.create!(
  title: "Second semester meeting",
  content: "The second semester has started and we would like to have one-on-one meeting to talk about the progress your children made in the first semester, as well as what to focus on onwards.",
  date: "2021-9-22",
  teacher: sae,
  kurasu: class_one_a,
  hour: 1
)

Meeting.create!(
  title: "Second semester meeting",
  content: "The second semester has started and we would like to have one-on-one meeting to talk about the progress your children made in the first semester, as well as what to focus on onwards.",
  date: "2021-9-22",
  teacher: sae,
  kurasu: class_one_a,
  hour: 2
)

Meeting.create!(
  title: "Second semester meeting",
  content: "The second semester has started and we would like to have one-on-one meeting to talk about the progress your children made in the first semester, as well as what to focus on onwards.",
  date: "2021-9-22",
  teacher: sae,
  kurasu: class_one_a,
  hour: 3
)

Meeting.create!(
  title: "Second semester meeting",
  content: "The second semester has started and we would like to have one-on-one meeting to talk about the progress your children made in the first semester, as well as what to focus on onwards.",
  date: "2021-9-22",
  teacher: sae,
  kurasu: class_one_a,
  hour: 4
)
puts "Meetings created"
