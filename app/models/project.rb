class Project < ApplicationRecord
  validates :title, :due_date, :status, presence: true
  has_one :budget
  belongs_to :user
  belongs_to :team, optional: true
  has_many :tasks
  has_many :participants
  enum :status, { in_progress: 0, completed: 1, rejected: 2, on_hold: 3 }

  def current?
    return due_date < Date.today if status == 'in_progress'

    true
  end
end
