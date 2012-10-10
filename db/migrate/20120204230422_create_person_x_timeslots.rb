class CreatePersonXTimeslots < ActiveRecord::Migration
  def change
    create_table :person_x_timeslots do |t|
      t.integer :person_id
      t.integer :timeslot_id

      t.timestamps
    end
  end
end
