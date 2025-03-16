class AddSelfIntroductionToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :self_introduction, :text
  end
end
