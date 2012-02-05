class ChangeFreetime < ActiveRecord::Migration
  def change
    remove_column :freetimes, :timeslot_id, :integer
    add_column :freetimes, :date, :date
    add_column :freetimes, :from , :integer
    add_column :freetimes, :to, :integer
  end
end
