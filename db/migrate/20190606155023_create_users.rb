class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :img_url
      t.string :neighborhood
      t.string :email
      t.string :phone
      t.string :bio

      t.timestamps
    end
  end
end
