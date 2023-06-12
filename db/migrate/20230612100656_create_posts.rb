class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :rule_id, null: false
      t.integer :room_id, null: false
      t.text :text
      t.integer :password
      t.timestamps
    end
  end
end
