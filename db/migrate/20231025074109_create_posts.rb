class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
