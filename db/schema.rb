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

ActiveRecord::Schema.define(version: 20160114052004) do

  create_table "nuerons", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "vid"
    t.text     "note"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "token"
    t.boolean  "is_valid",       default: true
    t.integer  "update_user_id"
  end

  add_index "nuerons", ["title"], name: "index_nuerons_on_title"
  add_index "nuerons", ["token"], name: "index_nuerons_on_token"
  add_index "nuerons", ["update_user_id"], name: "index_nuerons_on_update_user_id"
  add_index "nuerons", ["user_id"], name: "index_nuerons_on_user_id"

  create_table "startings", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "nueron_id"
    t.string   "image"
    t.boolean  "is_open",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "startings", ["nueron_id"], name: "index_startings_on_nueron_id"
  add_index "startings", ["user_id"], name: "index_startings_on_user_id"

  create_table "synapses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "origin_id"
    t.integer  "next_id"
    t.integer  "weight",     default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "synapses", ["next_id"], name: "index_synapses_on_next_id"
  add_index "synapses", ["origin_id", "next_id"], name: "index_synapses_on_origin_id_and_next_id", unique: true
  add_index "synapses", ["origin_id"], name: "index_synapses_on_origin_id"
  add_index "synapses", ["user_id"], name: "index_synapses_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                     null: false
    t.integer  "item_id",                       null: false
    t.string   "event",                         null: false
    t.string   "whodunnit"
    t.text     "object",     limit: 1073741823
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
