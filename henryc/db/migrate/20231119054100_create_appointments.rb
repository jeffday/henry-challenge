class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.bigint :provider_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
