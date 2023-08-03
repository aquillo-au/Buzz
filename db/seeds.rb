# clean the DB
Appointment.destroy_all
Membership.destroy_all
Team.destroy_all
Job.destroy_all
Task.destroy_all
Project.destroy_all
User.destroy_all
Worker.destroy_all

# create the seed

frank_user = User.create!(
  email: 'frank@lewagon.com',
  password: 'franktest'
)
frank = Worker.create!(
  name: 'Frank',
  phone: '0405 555 555',
  user: frank_user,
  pay_rate: 10.45
)

bertha_user = User.create!(
  email: 'bertha@lewagon.com',
  password: 'berthatest',
)
bertha = Worker.create!(
  name: 'Bertha',
  phone: '0406 666 666',
  user: bertha_user,
  pay_rate: 16.45
)

fred = Worker.create!(
  name: 'Fred',
  phone: '0406 666 666',
  pay_rate: 8.45
)

project = Project.create!(
  title: 'Working Test',
  due_date: Date.today + 7,
  description: 'We need to make breakfast',
  worker: frank
)

team = Team.create!(
  name: 'Breakfast Crew',
  location: 'the kitchen'
)

Membership.create!(
  worker: frank,
  team: team,
  leader: true
)

Membership.create!(
  worker: bertha,
  team: team,
  leader: false
)

Membership.create!(
  worker: fred,
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
  worker: frank,
  task: make_toast
)

Job.create!(
  title: 'Burn the Bread',
  worker: bertha,
  task: make_toast
)

puts 'DB seeded'
