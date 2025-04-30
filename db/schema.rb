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

ActiveRecord::Schema[7.0].define(version: 2025_04_07_194115) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "question_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_comments_on_question_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "mentor_specialties", force: :cascade do |t|
    t.bigint "mentor_id", null: false
    t.bigint "specialty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentor_id"], name: "index_mentor_specialties_on_mentor_id"
    t.index ["specialty_id"], name: "index_mentor_specialties_on_specialty_id"
  end

  create_table "mentor_types", force: :cascade do |t|
    t.string "short_name"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "mentor_type_id"
    t.string "profession"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentor_type_id"], name: "index_mentors_on_mentor_type_id"
    t.index ["user_id"], name: "index_mentors_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "question"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.bigint "mentor_type_id"
    t.bigint "specialty_id"
    t.integer "comment_count"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "short_name"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mentor_type_id", null: false
    t.index ["mentor_type_id"], name: "index_specialties_on_mentor_type_id"
  end

  create_table "student_board_leads", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "board_lead_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_lead_id"], name: "index_student_board_leads_on_board_lead_id"
    t.index ["user_id"], name: "index_student_board_leads_on_user_id"
  end

  create_table "student_en_me_mentors", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "mentor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentor_id"], name: "index_student_en_me_mentors_on_mentor_id"
    t.index ["student_id"], name: "index_student_en_me_mentors_on_student_id"
  end

  create_table "student_specialties", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "specialty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specialty_id"], name: "index_student_specialties_on_specialty_id"
    t.index ["student_id"], name: "index_student_specialties_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "major"
    t.string "classification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mentor_type_id"
    t.index ["mentor_type_id"], name: "index_students_on_mentor_type_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email", null: false
    t.string "role"
    t.string "library"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isAdmin", default: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comments", "questions"
  add_foreign_key "comments", "users"
  add_foreign_key "mentor_specialties", "mentors"
  add_foreign_key "mentor_specialties", "specialties"
  add_foreign_key "mentors", "mentor_types"
  add_foreign_key "mentors", "users"
  add_foreign_key "questions", "users"
  add_foreign_key "specialties", "mentor_types"
  add_foreign_key "student_board_leads", "users"
  add_foreign_key "student_board_leads", "users", column: "board_lead_id"
  add_foreign_key "student_en_me_mentors", "mentors"
  add_foreign_key "student_en_me_mentors", "students"
  add_foreign_key "student_specialties", "specialties"
  add_foreign_key "student_specialties", "students"
  add_foreign_key "students", "mentor_types"
  add_foreign_key "students", "users"
end
