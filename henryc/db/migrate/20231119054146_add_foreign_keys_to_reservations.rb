class AddForeignKeysToReservations < ActiveRecord::Migration[7.1]
  def up
    add_foreign_key :reservations, :appointments
    add_foreign_key :reservations, :clients
  end

  def down
    remove_foreign_key :reservations, :appointments
    remove_foreign_key :reservations, :clients
  end
end
