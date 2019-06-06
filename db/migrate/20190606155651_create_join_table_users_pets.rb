class CreateJoinTableUsersPets < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :pets do |t|
      # t.index [:user_id, :pet_id]
      # t.index [:pet_id, :user_id]
    end
  end
end
