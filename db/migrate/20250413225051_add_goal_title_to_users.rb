class AddGoalTitleToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :goal_title, :string
  end
end
