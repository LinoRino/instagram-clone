class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :followers, %i[follower_id followed_id], unique: true
  end
end
