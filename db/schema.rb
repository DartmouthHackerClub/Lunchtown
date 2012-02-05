# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120205004251) do

  create_table "appointments", :force => true do |t|
    t.integer  "lunchdate_id"
    t.integer  "timeslot_id"
    t.integer  "location_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "freetimes", :force => true do |t|
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.integer  "from"
    t.integer  "to"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "persons", :force => true do |t|
    t.string   "username"
    t.string   "dnd_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
