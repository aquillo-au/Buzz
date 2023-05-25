class Team < ApplicationRecord
  has_many :appointments
  has_many :projects, through: :appointments
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
end
