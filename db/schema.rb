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

ActiveRecord::Schema.define(version: 20161129160750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employee_participations", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "study_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_employee_participations_on_employee_id", using: :btree
    t.index ["study_id"], name: "index_employee_participations_on_study_id", using: :btree
  end

  create_table "employees", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "manager_id"
    t.integer  "study_id"
    t.json     "content",     default: []
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["employee_id"], name: "index_entries_on_employee_id", using: :btree
    t.index ["manager_id"], name: "index_entries_on_manager_id", using: :btree
    t.index ["study_id"], name: "index_entries_on_study_id", using: :btree
  end

  create_table "leadings", force: :cascade do |t|
    t.integer  "manager_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_leadings_on_employee_id", using: :btree
    t.index ["manager_id"], name: "index_leadings_on_manager_id", using: :btree
  end

  create_table "manager_participations", force: :cascade do |t|
    t.integer  "manager_id"
    t.integer  "study_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_manager_participations_on_manager_id", using: :btree
    t.index ["study_id"], name: "index_manager_participations_on_study_id", using: :btree
  end

  create_table "manager_surveys", force: :cascade do |t|
    t.string   "form_name"
    t.integer  "study_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_id"], name: "index_manager_surveys_on_study_id", using: :btree
  end

  create_table "managers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_options_on_question_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.text     "body"
    t.integer  "manager_survey_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "kind"
    t.index ["manager_survey_id"], name: "index_questions_on_manager_survey_id", using: :btree
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
    t.string   "company"
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

  add_foreign_key "employee_participations", "studies"
  add_foreign_key "employee_participations", "users", column: "employee_id"
  add_foreign_key "entries", "studies"
  add_foreign_key "entries", "users", column: "employee_id"
  add_foreign_key "entries", "users", column: "manager_id"
  add_foreign_key "leadings", "users", column: "employee_id"
  add_foreign_key "leadings", "users", column: "manager_id"
  add_foreign_key "manager_participations", "studies"
  add_foreign_key "manager_participations", "users", column: "manager_id"
  add_foreign_key "manager_surveys", "studies"
  add_foreign_key "options", "questions"
  add_foreign_key "questions", "manager_surveys"
  add_foreign_key "studies", "users", column: "researcher_id"
end
