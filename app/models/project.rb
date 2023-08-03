class Project < ApplicationRecord
  validates :title, :due_date, :status, presence: true
  has_one :budget
  belongs_to :worker
  has_many :appointments
  has_many :teams, through: :appointments
  has_many :tasks
  enum :status, { in_progress: 0, completed: 1, rejected: 2, on_hold: 3 }, _default: 0

  def current?
    return due_date < Date.today if status == 'in_progress'

    true
  end
end
