class AddTakenToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :taken, :boolean, default: false
  end
end
