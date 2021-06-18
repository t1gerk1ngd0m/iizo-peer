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

ActiveRecord::Schema.define(version: 2021_06_18_083554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "iizo_stamps", force: :cascade do |t|
    t.uuid "to_user_id", null: false
    t.uuid "from_user_id", null: false
    t.integer "slack_event_type", default: 0, null: false
    t.string "slack_event_id", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_user_id"], name: "index_iizo_stamps_on_from_user_id"
    t.index ["to_user_id"], name: "index_iizo_stamps_on_to_user_id"
  end

  create_table "iizos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "to_user_id", null: false
    t.uuid "from_user_id", null: false
    t.text "message"
    t.string "response_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_user_id"], name: "index_iizos_on_from_user_id"
    t.index ["to_user_id"], name: "index_iizos_on_to_user_id"
  end

  create_table "teams", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "slack_id", default: "", null: false, comment: "SlackチームID"
    t.string "slack_name", default: "", null: false, comment: "Slackチーム名"
    t.string "slack_domain", default: "", null: false, comment: "Slackチームドメイン"
    t.string "slack_access_token", default: "", null: false, comment: "アプリインストール時に発行されたトークン"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "slack_id", default: "", null: false, comment: "SlackユーザーID"
    t.string "slack_name", default: "", null: false, comment: "Slackユーザー名"
    t.uuid "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "iizo_stamps", "users", column: "from_user_id"
  add_foreign_key "iizo_stamps", "users", column: "to_user_id"
  add_foreign_key "iizos", "users", column: "from_user_id"
  add_foreign_key "iizos", "users", column: "to_user_id"
  add_foreign_key "users", "teams"
end
