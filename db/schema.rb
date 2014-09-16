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

ActiveRecord::Schema.define(version: 20140916185401) do

  create_table "a_courses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "a_presences", force: true do |t|
    t.integer  "student_id"
    t.date     "date"
    t.boolean  "absent"
    t.integer  "user_id"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "a_presences", ["date"], name: "index_presences_on_date", using: :btree

  create_table "a_presences_subjects", id: false, force: true do |t|
    t.integer "presence_id"
    t.integer "subject_id"
  end

  create_table "a_schema_migrations", id: false, force: true do |t|
    t.string "version", null: false
  end

  add_index "a_schema_migrations", ["version"], name: "unique_schema_migrations", unique: true, using: :btree

  create_table "a_students", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "course_id"
    t.boolean  "awaited_Mon"
    t.boolean  "awaited_Tue"
    t.boolean  "awaited_Wed"
    t.boolean  "awaited_Thu"
    t.boolean  "awaited_Fri"
    t.boolean  "awaited_Sat"
    t.boolean  "awaited_Sun"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "a_subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "a_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "surname"
    t.string   "name"
    t.boolean  "administrator"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "a_users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "a_users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presences", force: true do |t|
    t.integer  "student_id"
    t.date     "date"
    t.integer  "user_id"
    t.boolean  "present"
    t.string   "note"
    t.boolean  "toilet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presences_subjects", id: false, force: true do |t|
    t.integer "presence_id"
    t.integer "subject_id"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "course_id"
    t.time     "awaited_Mon"
    t.time     "awaited_Tue"
    t.time     "awaited_Wed"
    t.time     "awaited_Thu"
    t.time     "awaited_Fri"
    t.time     "awaited_Sat"
    t.time     "awaited_Sun"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "surname"
    t.string   "name"
    t.boolean  "administrator"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
