class ChangeUserIdTypeInComments < ActiveRecord::Migration[7.1]
  def change
    change_column :comments, :user_id, :integer
  end
end
