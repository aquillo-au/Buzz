class AddTeamToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :team, null: true, foreign_key: true
  end
end
