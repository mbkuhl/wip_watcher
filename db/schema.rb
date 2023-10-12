# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_12_041943) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hobbyists", force: :cascade do |t|
    t.string "name"
    t.integer "weekly_free_hours"
    t.integer "disposible_income"
    t.boolean "has_kids"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.integer "required_time"
    t.integer "current_completion"
    t.integer "start_cost"
    t.integer "cost_rate"
    t.boolean "completed", default: false
    t.boolean "abandoned", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hobbyist_id", null: false
    t.index ["hobbyist_id"], name: "index_projects_on_hobbyist_id"
  end

  add_foreign_key "projects", "hobbyists"
end
