class CreateEventsPets < ActiveRecord::Migration[5.2]
  def change
    create_table :events_pets do |t|
      t.integer :pet_id, null: false, foreign_key: true
      t.integer :event_id, null: false, foreign_key: true
    end
  end
end
