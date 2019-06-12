class CreatePetsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :pets_users do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :pet_id, null: false, foreign_key: true
    end
  end
end
