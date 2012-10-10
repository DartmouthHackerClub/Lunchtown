class FixTimeslot < ActiveRecord::Migration
  def change
      rename_column :timeslots, :hour, :hourfrom
      rename_column :timeslots, :minute, :minutefrom
      add_column :timeslots, :hourto, :integer
      add_column :timeslots, :minuteto, :integer
  end
end
