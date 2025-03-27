class CreateGoals < ActiveRecord::Migration[7.2]
  def change
    create_table :goals do |t|
      t.string :title
      t.integer :target_amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
