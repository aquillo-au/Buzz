class Task < ApplicationRecord
  validates :title, presence: true
  has_many :jobs
  has_many :assignments
  belongs_to :project

  enum :status, { in_progress: 0, completed: 1, rejected: 2 }

  def current?
    return due_date < Date.today if status == 'in_progress'

    true
  end
end
