class CreateOpenings < ActiveRecord::Migration[7.1]
  def up
    create_table :openings do |t|
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end

  def down
    drop_table :openings
  end
end
