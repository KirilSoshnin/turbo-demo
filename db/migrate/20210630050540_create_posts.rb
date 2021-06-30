class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :body, null: false
      t.integer :likes_count, default: 0, null: false

      t.timestamps
    end
  end
end
