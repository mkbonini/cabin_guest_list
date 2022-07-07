class CreateCabin < ActiveRecord::Migration[5.2]
  def change
    create_table :cabins do |t|
      t.string :title
      t.boolean :co_ed
      t.integer :max_guest_count
      
      t.timestamps
    end
  end
end
