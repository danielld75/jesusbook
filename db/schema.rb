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

ActiveRecord::Schema.define(version: 20170323081052) do

  create_table "baptisms", force: :cascade do |t|
    t.date     "sacrament_date"
    t.string   "local"
    t.string   "parish"
    t.string   "minister"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_baptisms_on_user_id"
  end

  create_table "confirm_sacraments", force: :cascade do |t|
    t.date     "sacrament_date"
    t.string   "local"
    t.string   "parish"
    t.string   "minister"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_confirm_sacraments_on_user_id"
  end

  create_table "first_holy_communions", force: :cascade do |t|
    t.date     "sacrament_date"
    t.string   "local"
    t.string   "parish"
    t.string   "minister"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_first_holy_communions_on_user_id"
  end

  create_table "marriages", force: :cascade do |t|
    t.date     "sacrament_date"
    t.string   "local"
    t.string   "parish"
    t.string   "minister"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_marriages_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "post_image_file_name"
    t.string   "post_image_content_type"
    t.integer  "post_image_file_size"
    t.datetime "post_image_updated_at"
    t.string   "url_youtube"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "priesthoods", force: :cascade do |t|
    t.date     "sacrament_date"
    t.string   "local"
    t.string   "parish"
    t.string   "minister"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_priesthoods_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "lastName"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "country"
    t.date     "baptism_date_user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
