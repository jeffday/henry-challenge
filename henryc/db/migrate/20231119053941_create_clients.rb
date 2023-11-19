class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.primary_key :id
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end