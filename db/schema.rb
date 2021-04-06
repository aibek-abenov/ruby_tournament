# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_06_122650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "division_stats", force: :cascade do |t|
    t.string "division"
    t.string "team"
    t.integer "win"
    t.integer "draw"
    t.integer "loss"
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "divisions", force: :cascade do |t|
    t.string "division_name"
    t.string "team_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "final_stats", force: :cascade do |t|
    t.string "team"
    t.integer "win"
    t.integer "loss"
    t.boolean "is_winner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "playoff_stats", force: :cascade do |t|
    t.string "division"
    t.string "team"
    t.integer "win"
    t.integer "loss"
    t.boolean "to_semifinal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "semifinal_stats", force: :cascade do |t|
    t.string "division"
    t.string "team"
    t.integer "win"
    t.integer "loss"
    t.boolean "to_final"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
