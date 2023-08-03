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

ActiveRecord::Schema[7.0].define(version: 2023_05_11_234301) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "team_id"], name: "index_appointments_on_project_id_and_team_id", unique: true
    t.index ["project_id"], name: "index_appointments_on_project_id"
    t.index ["team_id"], name: "index_appointments_on_team_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "worker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_assignments_on_task_id"
    t.index ["worker_id"], name: "index_assignments_on_worker_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.float "total"
    t.float "spent"
    t.float "allocated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_budgets_on_project_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "worker_id", null: false
    t.boolean "status"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_jobs_on_task_id"
    t.index ["worker_id"], name: "index_jobs_on_worker_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.boolean "leader", default: false
    t.bigint "team_id", null: false
    t.bigint "worker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_memberships_on_team_id"
    t.index ["worker_id"], name: "index_memberships_on_worker_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "worker_id", null: false
    t.bigint "project_id", null: false
    t.integer "type", default: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_participants_on_project_id"
    t.index ["worker_id"], name: "index_participants_on_worker_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.date "due_date"
    t.text "description"
    t.integer "status", default: 0
    t.bigint "worker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["worker_id"], name: "index_projects_on_worker_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.integer "estimated_time"
    t.date "due_date"
    t.text "description"
    t.string "title"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "phone"
    t.float "pay_rate"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workers_on_user_id"
  end

  add_foreign_key "appointments", "projects"
  add_foreign_key "appointments", "teams"
  add_foreign_key "assignments", "tasks"
  add_foreign_key "assignments", "workers"
  add_foreign_key "budgets", "projects"
  add_foreign_key "jobs", "tasks"
  add_foreign_key "jobs", "workers"
  add_foreign_key "memberships", "teams"
  add_foreign_key "memberships", "workers"
  add_foreign_key "participants", "projects"
  add_foreign_key "participants", "workers"
  add_foreign_key "projects", "workers"
  add_foreign_key "tasks", "projects"
  add_foreign_key "workers", "users"
end
