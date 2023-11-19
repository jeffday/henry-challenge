class CreateOpenings < ActiveRecord::Migration[7.1]
  def up
    create_table :openings do |t|
      t.date :date
      t.time :start
      t.time :end

      t.timestamps
    end
  end

  def down
    drop_table :openings
  end
end
