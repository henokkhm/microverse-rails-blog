class AddReferencesAndCountersToPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :author_id
    add_reference :posts, :author, foreign_key: { to_table: :users }

    add_column :posts, :likes_counter, :integer, default: 0
    add_column :posts, :comments_counter, :integer, default: 0
  end
end
