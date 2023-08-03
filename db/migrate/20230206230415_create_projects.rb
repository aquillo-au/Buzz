class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.date :due_date
      t.text :description
      t.integer :status, default: 0
      t.references :worker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
