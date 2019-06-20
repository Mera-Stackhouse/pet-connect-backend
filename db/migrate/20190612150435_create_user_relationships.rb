class CreateUserRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :user_relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.boolean :confirmed, :default => false

      t.timestamps
    end
  end
end
