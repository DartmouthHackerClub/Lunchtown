class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.integer :weekday
      t.integer :hour
      t.integer :minute

      t.timestamps
    end
  end
end
