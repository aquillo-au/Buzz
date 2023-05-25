# clean the DB
Appointment.destroy_all
Membership.destroy_all
Team.destroy_all
Job.destroy_all
Task.destroy_all
Project.destroy_all
User.destroy_all

# create the seed

frank = User.create!(
  name: 'Frank',
  email: 'frank@lewagon.com',
  password: 'franktest',
  phone: '0405 555 555',
  pay_rate: 10.45
)

bertha = User.create!(
  name: 'Bertha',
  email: 'bertha@lewagon.com',
  password: 'berthatest',
  phone: '0406 666 666',
  pay_rate: 16.45
)

fred = User.create!(
  name: 'Fred',
  email: 'fred@lewagon.com',
  password: 'fredtest',
  phone: '0406 666 666',
  pay_rate: 16.45
)

project = Project.create!(
  title: 'Working Test',
  due_date: Date.today + 7,
  description: 'We need to make breakfast',
  user: frank
)

team = Team.create!(
  name: 'Breakfast Crew',
  location: 'the kitchen'
)

Membership.create!(
  user: frank,
  team: team,
  leader: true
)

Membership.create!(
  user: bertha,
  team: team,
  leader: false
)

Appointment.create!(
  team: team,
  project: project
)

make_toast = Task.create!(
  title: 'Make Toast',
  estimated_time: 5,
  due_date: Date.today + 3,
  description: 'Make a slice of burnt Bread',
  project: project
)

Job.create!(
  title: 'Slice the Bread',
  user: frank,
  task: make_toast
)

Job.create!(
  title: 'Burn the Bread',
  user: bertha,
  task: make_toast
)

puts 'DB seeded'
