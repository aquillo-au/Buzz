class Budget < ApplicationRecord
  validates :total, presence: true
  belongs_to :project
  def in_budget?
    (total - (spent + allocated)) >= 0
  end
end
