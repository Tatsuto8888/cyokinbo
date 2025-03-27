class CreateSavings < ActiveRecord::Migration[7.2]
  def change
    create_table :savings do |t|
      t.integer :amount
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
