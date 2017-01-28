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

ActiveRecord::Schema.define(version: 20170128222133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string   "title"
    t.datetime "due_date"
    t.float    "duration"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "expiration_time"
    t.integer  "index"
    t.string   "token"
    t.boolean  "expired"
    t.boolean  "late"
    t.boolean  "draft"
    t.boolean  "done"
    t.boolean  "can_show_pipe"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "current_phase_id"
    t.integer  "previous_phase_id"
    t.integer  "next_phase_id"
  end

  create_table "field_values", force: :cascade do |t|
    t.integer  "field_id"
    t.string   "value"
    t.string   "display_value"
    t.integer  "card_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["card_id"], name: "index_field_values_on_card_id", using: :btree
    t.index ["field_id"], name: "index_field_values_on_field_id", using: :btree
  end

  create_table "fields", force: :cascade do |t|
    t.integer  "phase_id"
    t.string   "label"
    t.string   "default_value"
    t.integer  "type_id"
    t.integer  "index"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["phase_id"], name: "index_fields_on_phase_id", using: :btree
    t.index ["type_id"], name: "index_fields_on_type_id", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phases", force: :cascade do |t|
    t.string   "name"
    t.integer  "pipe_id"
    t.integer  "index"
    t.boolean  "can_edit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pipe_id"], name: "index_phases_on_pipe_id", using: :btree
  end

  create_table "pipes", force: :cascade do |t|
    t.string   "name"
    t.string   "token"
    t.boolean  "can_edit"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_pipes_on_organization_id", using: :btree
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.text     "component"
    t.string   "html_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cards", "phases", column: "current_phase_id"
  add_foreign_key "cards", "phases", column: "next_phase_id"
  add_foreign_key "cards", "phases", column: "previous_phase_id"
  add_foreign_key "field_values", "cards"
  add_foreign_key "field_values", "fields"
  add_foreign_key "fields", "phases"
  add_foreign_key "fields", "types"
  add_foreign_key "phases", "pipes"
  add_foreign_key "pipes", "organizations"
end
