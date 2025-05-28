class FixPostsUserIdType < ActiveRecord::Migration[7.1]
  def up
    add_column :posts, :user_id_bigint, :bigint

    execute <<-SQL.squish
      UPDATE posts SET user_id_bigint = CAST(user_id AS INTEGER)
    SQL

    add_foreign_key :posts, :users, column: :user_id_bigint

    remove_column :posts, :user_id

    rename_column :posts, :user_id_bigint, :user_id

    change_column_null :posts, :user_id, false
  end

  def down
    add_column :posts, :user_id, :string

    execute <<-SQL.squish
      UPDATE posts SET user_id = CAST(user_id AS TEXT)
    SQL

    remove_foreign_key :posts, column: :user_id
    remove_column :posts, :user_id
    rename_column :posts, :user_id, :user_id
  end
end
