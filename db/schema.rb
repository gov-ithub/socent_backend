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

ActiveRecord::Schema.define(version: 20161110134737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "enterprises", force: :cascade do |t|
    t.string   "number",                                            null: false
    t.string   "name",                                              null: false
    t.string   "tax_registration_code"
    t.date     "application_date",                                  null: false
    t.date     "founded_at"
    t.string   "primary_industry_classification_clasz"
    t.string   "secondary_industry_classifications",                             array: true
    t.integer  "social_intervention_domain_id"
    t.integer  "enterprise_category_id"
    t.string   "contact_name"
    t.integer  "entrepreneur_id"
    t.integer  "status",                                default: 0, null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["enterprise_category_id"], name: "index_enterprises_on_enterprise_category_id", using: :btree
    t.index ["entrepreneur_id"], name: "index_enterprises_on_entrepreneur_id", using: :btree
    t.index ["name"], name: "index_enterprises_on_name", using: :btree
    t.index ["number"], name: "index_enterprises_on_number", unique: true, using: :btree
    t.index ["social_intervention_domain_id"], name: "index_enterprises_on_social_intervention_domain_id", using: :btree
    t.index ["tax_registration_code"], name: "index_enterprises_on_tax_registration_code", using: :btree
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

  create_table "industry_classifications", primary_key: "clasz", id: :string, force: :cascade do |t|
    t.string   "section",     null: false
    t.string   "division",    null: false
    t.string   "group",       null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  add_foreign_key "enterprises", "enterprise_categories"
  add_foreign_key "enterprises", "entrepreneurs"
  add_foreign_key "enterprises", "industry_classifications", column: "primary_industry_classification_clasz", primary_key: "clasz"
  add_foreign_key "enterprises", "social_intervention_domains"
  add_foreign_key "social_intervention_domains", "social_intervention_domain_categories"
end
