class CreateOpenings < ActiveRecord::Migration[7.1]
  def change
    create_table :openings do |t|
      t.primary_key :id
      t.date :date
      t.time :start
      t.time :end

      t.timestamps
    end
  end
end
