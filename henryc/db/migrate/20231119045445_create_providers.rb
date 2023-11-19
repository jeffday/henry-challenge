class CreateProviders < ActiveRecord::Migration[7.1]
  def up
    create_table :providers do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end

  def down
    drop_table :providers
  end
end
