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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161126052053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leadings", force: :cascade do |t|
    t.integer  "manager_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_leadings_on_employee_id", using: :btree
    t.index ["manager_id"], name: "index_leadings_on_manager_id", using: :btree
  end

  create_table "managers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "study_id"
    t.index ["study_id"], name: "index_managers_on_study_id", using: :btree
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "manager_id"
    t.integer  "study_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_participations_on_manager_id", using: :btree
    t.index ["study_id"], name: "index_participations_on_study_id", using: :btree
  end

  create_table "researchers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studies", force: :cascade do |t|
    t.string   "title"
    t.string   "status"
    t.integer  "num_of_managers"
    t.integer  "num_of_employees"
    t.integer  "researcher_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["researcher_id"], name: "index_studies_on_researcher_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.text     "oauth_raw_data"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "type"
  end

  add_foreign_key "leadings", "users", column: "employee_id"
  add_foreign_key "leadings", "users", column: "manager_id"
  add_foreign_key "managers", "studies"
  add_foreign_key "participations", "studies"
  add_foreign_key "participations", "users", column: "manager_id"
  add_foreign_key "studies", "users", column: "researcher_id"
end
