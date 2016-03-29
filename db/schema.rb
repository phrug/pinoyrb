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

ActiveRecord::Schema.define(version: 20140423143711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "affiliations", force: :cascade do |t|
    t.integer  "entity_id"
    t.integer  "user_id"
    t.string   "position"
    t.boolean  "current"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "affiliations", ["entity_id"], name: "index_affiliations_on_entity_id", using: :btree
  add_index "affiliations", ["user_id"], name: "index_affiliations_on_user_id", using: :btree

  create_table "contributors", force: :cascade do |t|
    t.integer  "contributable_id"
    t.string   "contributable_type"
    t.integer  "project_id"
    t.string   "role"
    t.boolean  "current"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contributors", ["contributable_id"], name: "index_contributors_on_contributable_id", using: :btree
  add_index "contributors", ["contributable_type"], name: "index_contributors_on_contributable_type", using: :btree
  add_index "contributors", ["project_id"], name: "index_contributors_on_project_id", using: :btree

  create_table "entities", force: :cascade do |t|
    t.string   "entity_type"
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.integer  "venue_id"
    t.boolean  "recruiting"
    t.boolean  "display"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entities", ["slug"], name: "index_entities_on_slug", unique: true, using: :btree
  add_index "entities", ["venue_id"], name: "index_entities_on_venue_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "event_type"
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.integer  "venue_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "youtube_playlist"
  end

  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree
  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.string   "link_type"
    t.string   "linkable_type"
    t.integer  "linkable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentation_tags", force: :cascade do |t|
    t.integer  "presentation_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "presentation_tags", ["presentation_id"], name: "index_presentation_tags_on_presentation_id", using: :btree
  add_index "presentation_tags", ["tag_id"], name: "index_presentation_tags_on_tag_id", using: :btree

  create_table "presentations", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.integer  "event_id"
    t.string   "youtube"
    t.string   "slideshare"
    t.string   "speakerdeck"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "display_order"
  end

  add_index "presentations", ["event_id"], name: "index_presentations_on_event_id", using: :btree
  add_index "presentations", ["slug"], name: "index_presentations_on_slug", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "project_type"
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.string   "website"
    t.string   "source_code"
    t.string   "pic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree

  create_table "rails_admin_histories", force: :cascade do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "speakers", force: :cascade do |t|
    t.integer  "presentation_id"
    t.integer  "user_id"
    t.text     "custom_bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "speakers", ["presentation_id"], name: "index_speakers_on_presentation_id", using: :btree
  add_index "speakers", ["user_id"], name: "index_speakers_on_user_id", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "entity_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sponsors", ["entity_id"], name: "index_sponsors_on_entity_id", using: :btree
  add_index "sponsors", ["event_id"], name: "index_sponsors_on_event_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["slug"], name: "index_tags_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "slug"
    t.string   "blurb"
    t.text     "about_me"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "address"
    t.text     "directions"
    t.decimal  "latitude",   precision: 15, scale: 12
    t.decimal  "longitude",  precision: 15, scale: 12
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venues", ["slug"], name: "index_venues_on_slug", unique: true, using: :btree

end
