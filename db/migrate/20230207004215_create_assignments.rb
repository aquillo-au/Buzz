class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.references :task, null: false, foreign_key: true
      t.references :worker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
