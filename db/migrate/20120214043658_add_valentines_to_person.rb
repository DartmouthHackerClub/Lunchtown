class AddValentinesToPerson < ActiveRecord::Migration
  def change
    add_column :persons, :gender, :string
    add_column :persons, :looking_for, :string
  end
end
