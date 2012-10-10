class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :lunchdate_id
      t.integer :timeslot_id
      t.integer :location_id
      t.date :date

      t.timestamps
    end
  end
end
