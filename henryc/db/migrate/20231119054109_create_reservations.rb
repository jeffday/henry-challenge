class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.bigint :opening_id
      t.bigint :client_id

      t.timestamps
    end
  end
end
