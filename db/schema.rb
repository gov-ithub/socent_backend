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

ActiveRecord::Schema.define(version: 20161121100917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "district_id"
    t.string   "city"
    t.string   "address"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "enterprise_id"
    t.index ["district_id"], name: "index_addresses_on_district_id", using: :btree
    t.index ["enterprise_id"], name: "index_addresses_on_enterprise_id", using: :btree
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

  create_table "enterprises", force: :cascade do |t|
    t.string   "number",                                            null: false
    t.string   "name",                                              null: false
    t.integer  "certificate_type"
    t.string   "unique_registration_code"
    t.string   "tax_registration_by"
    t.string   "tax_registration_number"
    t.date     "application_date",                                  null: false
    t.date     "founded_at"
    t.integer  "primary_industry_classification_id"
    t.string   "secondary_industry_classifications",                             array: true
    t.integer  "primary_social_intervention_domain_id"
    t.string   "secondary_social_intervention_domains",                          array: true
    t.integer  "enterprise_category_id"
    t.string   "contact_name"
    t.integer  "entrepreneur_id"
    t.integer  "status",                                default: 0, null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "headquarters_id"
    t.index ["enterprise_category_id"], name: "index_enterprises_on_enterprise_category_id", using: :btree
    t.index ["entrepreneur_id"], name: "index_enterprises_on_entrepreneur_id", using: :btree
    t.index ["headquarters_id"], name: "index_enterprises_on_headquarters_id", using: :btree
    t.index ["name"], name: "index_enterprises_on_name", using: :btree
    t.index ["number"], name: "index_enterprises_on_number", unique: true, using: :btree
    t.index ["primary_industry_classification_id"], name: "index_enterprises_on_primary_industry_classification_id", using: :btree
    t.index ["primary_social_intervention_domain_id"], name: "index_enterprises_on_primary_social_intervention_domain_id", using: :btree
    t.index ["unique_registration_code"], name: "index_enterprises_on_unique_registration_code", using: :btree
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

  create_table "industry_classifications", force: :cascade do |t|
    t.string   "clasz"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "section"
    t.string   "division"
    t.string   "group"
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

  create_table "uploads", force: :cascade do |t|
    t.integer  "enterprise_id",              null: false
    t.string   "path",          limit: 1024, null: false
    t.string   "name",                       null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["enterprise_id", "name"], name: "index_uploads_on_enterprise_id_and_name", unique: true, using: :btree
    t.index ["enterprise_id"], name: "index_uploads_on_enterprise_id", using: :btree
  end

  create_table "vulnerable_groups", force: :cascade do |t|
    t.string   "description"
    t.text     "subgroups"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "addresses", "districts"
  add_foreign_key "addresses", "enterprises"
  add_foreign_key "enterprises", "addresses", column: "headquarters_id"
  add_foreign_key "enterprises", "enterprise_categories"
  add_foreign_key "enterprises", "entrepreneurs"
  add_foreign_key "enterprises", "industry_classifications", column: "primary_industry_classification_id"
  add_foreign_key "enterprises", "social_intervention_domains", column: "primary_social_intervention_domain_id"
  add_foreign_key "social_intervention_domains", "social_intervention_domain_categories"
  add_foreign_key "uploads", "enterprises"
end
