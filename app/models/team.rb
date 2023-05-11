class Team < ApplicationRecord
  has_many :projects
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
end
