class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.integer :follower_id, null: false, foreign_key: { to_table: :users }
      t.integer :followed_id, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
