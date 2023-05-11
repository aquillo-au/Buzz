class Job < ApplicationRecord
  validates :title, presence: true
  belongs_to :task
end
