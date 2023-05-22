class Appointment < ApplicationRecord
  belongs_to :team
  belongs_to :project
  validates :project, uniqueness: { scope: :team_id, message: 'Team is already assigned to this project' }
end
