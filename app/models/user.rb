class User < ApplicationRecord
  has_many :assignments
  has_many :memberships
  has_many :participants
  has_many :teams, through: :memberships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
