class Worker < ApplicationRecord
  belongs_to :user, optional: true
  has_many :assignments
  has_many :memberships
  has_many :participants
  has_many :jobs
  has_many :teams, through: :memberships
end
