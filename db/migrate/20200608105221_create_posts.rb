class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :body
      t.integer :topic_id

      t.timestamps
	  t.index :topic_id
    end
  end
end
