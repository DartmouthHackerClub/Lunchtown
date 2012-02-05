class DeleteTimeslots < ActiveRecord::Migration
  def up
    drop_table :timeslots
    rename_table :person_x_timeslots, :freetimes
  end

  def down
  end
end
