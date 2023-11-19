class AddProviderIdToOpenings < ActiveRecord::Migration[7.1]
  def up
    add_column :openings, :provider_id, :bigint
    add_foreign_key :openings, :providers
  end

  def down
    remove_foreign_key :openings, :provider_id
    remove_column :openings, :provider_id
  end
end
