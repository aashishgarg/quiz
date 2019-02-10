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

ActiveRecord::Schema.define(version: 2019_02_10_152414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers_questions", id: false, force: :cascade do |t|
    t.integer "option_id", null: false
    t.integer "question_id", null: false
  end

  create_table "attempts", force: :cascade do |t|
    t.bigint "quiz_id"
    t.bigint "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_attempts_on_option_id"
    t.index ["quiz_id"], name: "index_attempts_on_quiz_id"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "question_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizsets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "quizset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_quizzes_on_question_id"
    t.index ["quizset_id"], name: "index_quizzes_on_quizset_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["name"], name: "index_users_on_name"
  end

  add_foreign_key "attempts", "options"
  add_foreign_key "attempts", "quizzes"
  add_foreign_key "options", "questions"
  add_foreign_key "quizzes", "questions"
  add_foreign_key "quizzes", "quizsets"
end
