# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141114130030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alternatives", force: true do |t|
    t.text     "title"
    t.integer  "exibition_type"
    t.boolean  "correct"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alternatives", ["question_id"], name: "index_alternatives_on_question_id", using: :btree

  create_table "classifications", force: true do |t|
    t.string   "name"
    t.integer  "father_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "classifications", ["father_id"], name: "index_classifications_on_father_id", using: :btree

  create_table "divisions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table "exam_questions", force: true do |t|
    t.integer  "question_id"
    t.datetime "answer_date"
    t.integer  "exam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answer_id"
  end

  add_index "exam_questions", ["answer_id"], name: "index_exam_questions_on_answer_id", using: :btree
  add_index "exam_questions", ["exam_id"], name: "index_exam_questions_on_exam_id", using: :btree
  add_index "exam_questions", ["question_id"], name: "index_exam_questions_on_question_id", using: :btree

  create_table "exam_requests", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_rules", force: true do |t|
    t.integer  "quantity"
    t.integer  "classification_id"
    t.integer  "exam_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exam_rules", ["classification_id"], name: "index_exam_rules_on_classification_id", using: :btree
  add_index "exam_rules", ["exam_request_id"], name: "index_exam_rules_on_exam_request_id", using: :btree

  create_table "exams", force: true do |t|
    t.datetime "start_date"
    t.datetime "finish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_request_id"
    t.integer  "maker_id"
  end

  create_table "makers", force: true do |t|
    t.string   "name"
    t.integer  "division_id"
    t.integer  "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "makers", ["division_id"], name: "index_makers_on_division_id", using: :btree
  add_index "makers", ["identifier"], name: "index_makers_on_identifier", unique: true, using: :btree

  create_table "managers", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "disciplina"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "managers", ["email"], name: "index_managers_on_email", unique: true, using: :btree
  add_index "managers", ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true, using: :btree

  create_table "questions", force: true do |t|
    t.text     "title"
    t.integer  "exibition_type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "classification_id"
  end

  create_table "users", force: true do |t|
  end

end
