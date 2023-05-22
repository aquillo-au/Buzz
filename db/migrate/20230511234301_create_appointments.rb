class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :team, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.index %i[project_id team_id], unique: true
      t.timestamps
    end
  end
end
