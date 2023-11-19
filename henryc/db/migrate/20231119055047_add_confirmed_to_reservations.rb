class AddConfirmedToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :confirmed, :datetime
  end
end
