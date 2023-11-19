class AddForeignKeysToReservations < ActiveRecord::Migration[7.1]
  def up
    add_foreign_key :reservations, :openings
    add_foreign_key :reservations, :clients
  end

  def down
    remove_foreign_key :reservations, :openings
    remove_foreign_key :reservations, :clients
  end
end
