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

frank_membership = Membership.new
frank_membership.worker = frank
frank_membership.team = team
frank_membership.leader = true
frank_membership.save!

bertha_membership = Membership.new
bertha_membership.worker = bertha
bertha_membership.team = team
bertha_membership.save!

appointment = Appointment.new
appointment.team = team
appointment.project = project
appointment.save!

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
