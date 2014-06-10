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

ActiveRecord::Schema.define(version: 20140111013834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "type"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["remember_token"], name: "index_accounts_on_remember_token", using: :btree
  add_index "accounts", ["type"], name: "index_accounts_on_type", using: :btree

  create_table "candidates", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.text     "bio"
    t.boolean  "has_transport"
    t.string   "additional_skills"
    t.integer  "sponsor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "candidates", ["sponsor_id"], name: "index_candidates_on_sponsor_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "job_postings", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "city"
    t.string   "state"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employer_id"
  end

  add_index "job_postings", ["created_at"], name: "index_job_postings_on_created_at", using: :btree
  add_index "job_postings", ["employer_id"], name: "index_job_postings_on_employer_id", using: :btree

end
