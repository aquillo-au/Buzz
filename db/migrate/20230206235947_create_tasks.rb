class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.integer :estimated_time
      t.date :due_date
      t.text :description
      t.string :title
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
