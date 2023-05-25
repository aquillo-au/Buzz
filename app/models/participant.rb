class Participant < ApplicationRecord
  validates :status, presence: true
  belongs_to :user
  belongs_to :project
  enum :type, { leader: 0, manager: 1, worker: 2, observer: 3 }
end
