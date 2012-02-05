class CreateLunchdates < ActiveRecord::Migration
  def change
    create_table :persons do |t|
      t.cas_authenticatable
      t.string :dnd_id
      t.timestamps
    end
  end
end
