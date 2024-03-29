class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 50
      t.text :body, null: false

      t.timestamps
    end
  end
end
