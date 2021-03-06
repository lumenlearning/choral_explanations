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

ActiveRecord::Schema.define(version: 20161024034739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choruses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "context_id"
    t.integer  "user_id"
    t.string   "learning_outcome_guid"
    t.string   "license"
    t.jsonb    "settings",              default: "{}", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["context_id"], name: "index_choruses_on_context_id", using: :btree
    t.index ["user_id"], name: "index_choruses_on_user_id", using: :btree
  end

  create_table "contexts", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_context_id"
    t.boolean  "is_public",         default: false, null: false
    t.jsonb    "settings",          default: "{}",  null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["parent_context_id"], name: "index_contexts_on_parent_context_id", using: :btree
  end

  create_table "responses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "license"
    t.integer  "chorus_id",                  null: false
    t.integer  "user_id"
    t.integer  "context_id"
    t.jsonb    "settings",    default: "{}", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["chorus_id"], name: "index_responses_on_chorus_id", using: :btree
    t.index ["context_id"], name: "index_responses_on_context_id", using: :btree
    t.index ["user_id"], name: "index_responses_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.jsonb    "settings",   default: "{}", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "choruses", "contexts"
  add_foreign_key "choruses", "users"
  add_foreign_key "contexts", "contexts", column: "parent_context_id"
  add_foreign_key "responses", "choruses"
  add_foreign_key "responses", "contexts"
  add_foreign_key "responses", "users"
end
