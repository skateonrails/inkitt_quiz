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

ActiveRecord::Schema.define(version: 20171001195600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "alternatives", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "title"
    t.uuid "question_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_alternatives_on_question_id"
    t.index ["title", "question_id"], name: "index_alternatives_on_title_and_question_id", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "question_id"
    t.uuid "alternative_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alternative_id"], name: "index_answers_on_alternative_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id", "question_id"], name: "index_answers_on_user_id_and_question_id", unique: true
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "question_hierarchies", id: false, force: :cascade do |t|
    t.uuid "ancestor_id", null: false
    t.uuid "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "question_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "question_desc_idx"
  end

  create_table "questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "title"
    t.uuid "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_questions_on_title", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email"
    t.string "fingerprint_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email", "fingerprint_hash"], name: "index_users_on_email_and_fingerprint_hash", unique: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["fingerprint_hash"], name: "index_users_on_fingerprint_hash"
  end

  add_foreign_key "alternatives", "questions"
  add_foreign_key "answers", "alternatives"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
end
