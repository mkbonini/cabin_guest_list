class AddCabinsToGuests < ActiveRecord::Migration[5.2]
  def change
    add_reference :guests, :cabin, foreign_key: true
  end
end
