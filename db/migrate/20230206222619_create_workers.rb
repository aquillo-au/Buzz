class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.references :user, foreign_key: true, null: true
      t.string :phone
      t.float :pay_rate
      t.string :name, null: false
      t.timestamps
    end
  end
end
