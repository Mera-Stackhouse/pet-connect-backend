class CreateEventsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :events_users do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :event_id, null: false, foreign_key: true
    end
  end
end
