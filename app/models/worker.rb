class Worker < ApplicationRecord
  belongs_to :user, optional: true
  has_many :assignments
  has_many :memberships
  has_many :jobs
  has_many :teams, through: :memberships
  accepts_nested_attributes_for :user
end
