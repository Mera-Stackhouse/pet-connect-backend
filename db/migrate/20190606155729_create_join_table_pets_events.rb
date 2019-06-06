class CreateJoinTablePetsEvents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :pets, :events do |t|
      # t.index [:pet_id, :event_id]
      # t.index [:event_id, :pet_id]
    end
  end
end
