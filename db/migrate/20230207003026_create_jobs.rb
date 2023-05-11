class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.references :task, null: false, foreign_key: true
      t.boolean :status
      t.string :title

      t.timestamps
    end
  end
end
