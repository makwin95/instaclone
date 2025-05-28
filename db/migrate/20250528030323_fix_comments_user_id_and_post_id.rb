class FixCommentsUserIdAndPostId < ActiveRecord::Migration[7.1]
  def up
    add_column :comments, :user_id_bigint, :bigint
    add_column :comments, :post_id_bigint, :bigint

    execute <<-SQL.squish
      UPDATE comments SET user_id_bigint = CAST(user_id AS INTEGER), post_id_bigint = CAST(post_id AS INTEGER)
    SQL

    add_foreign_key :comments, :users, column: :user_id_bigint
    add_foreign_key :comments, :posts, column: :post_id_bigint

    remove_column :comments, :user_id
    remove_column :comments, :post_id

    rename_column :comments, :user_id_bigint, :user_id
    rename_column :comments, :post_id_bigint, :post_id

    change_column_null :comments, :user_id, false
    change_column_null :comments, :post_id, false
  end

  def down

    add_column :comments, :user_id_string, :string
    add_column :comments, :post_id_string, :string

    execute <<-SQL.squish
      UPDATE comments SET user_id_string = CAST(user_id AS TEXT), post_id_string = CAST(post_id AS TEXT)
    SQL

    remove_foreign_key :comments, column: :user_id
    remove_foreign_key :comments, column: :post_id
    remove_column :comments, :user_id
    remove_column :comments, :post_id

    rename_column :comments, :user_id_string, :user_id
    rename_column :comments, :post_id_string, :post_id
  end
end
