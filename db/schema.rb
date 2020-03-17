# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_17_212955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "services", force: :cascade do |t|
    t.text "hashed_id", null: false
    t.text "description"
    t.text "title"
    t.text "areas", default: [], null: false, array: true
    t.text "address_line_1"
    t.text "address_line_2"
    t.text "address_city"
    t.text "address_county"
    t.text "address_postcode"
    t.text "contact_name"
    t.text "contact_number"
    t.text "contact_email"
    t.text "contact_url"
    t.datetime "published_at"
    t.text "categories", default: [], null: false, array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "organisation"
    t.index ["areas"], name: "index_services_on_areas"
    t.index ["categories"], name: "index_services_on_categories"
    t.index ["hashed_id"], name: "index_services_on_hashed_id"
    t.index ["published_at"], name: "index_services_on_published_at"
  end

end
