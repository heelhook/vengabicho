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

ActiveRecord::Schema.define(version: 20150526110557) do

  create_table "exercises", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "training_area_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "type"
    t.string   "slug"
  end

  add_index "exercises", ["training_area_id"], name: "index_exercises_on_training_area_id"
  add_index "exercises", ["user_id"], name: "index_exercises_on_user_id"

  create_table "exercises_training_areas", force: :cascade do |t|
    t.integer "exercise_id"
    t.integer "training_area_id"
  end

  add_index "exercises_training_areas", ["exercise_id"], name: "index_exercises_training_areas_on_exercise_id"
  add_index "exercises_training_areas", ["training_area_id"], name: "index_exercises_training_areas_on_training_area_id"

  create_table "goals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "image_keywords"
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "training_area_points", force: :cascade do |t|
    t.integer  "training_area_id"
    t.integer  "workout_id"
    t.integer  "points"
    t.date     "date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
  end

  add_index "training_area_points", ["date"], name: "index_training_area_points_on_date"
  add_index "training_area_points", ["training_area_id"], name: "index_training_area_points_on_training_area_id"
  add_index "training_area_points", ["workout_id"], name: "index_training_area_points_on_workout_id"

  create_table "training_areas", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  add_index "training_areas", ["user_id"], name: "index_training_areas_on_user_id"

  create_table "training_periods", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "start"
    t.date     "finish"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "training_periods", ["user_id"], name: "index_training_periods_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "colors"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "weight_ins", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "weight"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "weight_ins", ["user_id"], name: "index_weight_ins_on_user_id"

  create_table "workout_exercises", force: :cascade do |t|
    t.integer  "workout_id"
    t.integer  "exercise_id"
    t.text     "comments"
    t.string   "data"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "number_of_sets"
    t.integer  "distance"
    t.string   "location"
  end

  add_index "workout_exercises", ["exercise_id"], name: "index_workout_exercises_on_exercise_id"
  add_index "workout_exercises", ["workout_id"], name: "index_workout_exercises_on_workout_id"

  create_table "workouts", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "date"
    t.integer  "motivation_level"
    t.integer  "energy_level"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "workouts", ["date"], name: "index_workouts_on_date"
  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id"

end
