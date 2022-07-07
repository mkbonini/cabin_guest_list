class CreateGuest < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :invite
      t.integer :plus_ones
      
      t.timestamps
    end
  end
end
