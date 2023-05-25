class Job < ApplicationRecord
  validates :title, presence: true
  belongs_to :task
  belongs_to :user
end
