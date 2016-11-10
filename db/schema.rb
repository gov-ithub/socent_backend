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

ActiveRecord::Schema.define(version: 20161110130133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caens", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_districts_on_name", unique: true, using: :btree
  end

  create_table "enterprise_categories", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "entrepreneurs", force: :cascade do |t|
    t.string   "identification_number"
    t.string   "name"
    t.string   "card_type"
    t.string   "card_series"
    t.string   "card_number"
    t.string   "issued_by"
    t.string   "designation"
    t.text     "proof_of_designation_url"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["identification_number"], name: "index_entrepreneurs_on_identification_number", unique: true, using: :btree
    t.index ["name"], name: "index_entrepreneurs_on_name", using: :btree
  end

  create_table "social_intervention_domain_categories", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "social_intervention_domains", force: :cascade do |t|
    t.string   "description"
    t.integer  "social_intervention_domain_category_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["social_intervention_domain_category_id"], name: "social_intervention_domains_category_id", using: :btree
  end

  add_foreign_key "social_intervention_domains", "social_intervention_domain_categories"
end
