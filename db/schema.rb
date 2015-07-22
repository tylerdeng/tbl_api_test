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

ActiveRecord::Schema.define(version: 20150722041656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "addresses", force: :cascade do |t|
    t.string   "type"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "country_code"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone_number"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "albums", force: :cascade do |t|
    t.string   "story"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.uuid     "uuid",       default: "uuid_generate_v4()"
  end

  add_index "albums", ["uuid"], name: "index_albums_on_uuid", unique: true, using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "type"
    t.integer  "album_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.uuid     "uuid",       default: "uuid_generate_v4()"
  end

  add_index "events", ["album_id"], name: "index_events_on_album_id", using: :btree
  add_index "events", ["uuid"], name: "index_events_on_uuid", unique: true, using: :btree

  create_table "group_memberships", force: :cascade do |t|
    t.string  "member_type"
    t.integer "member_id"
    t.integer "group_id"
    t.string  "group_name"
    t.string  "membership_type"
  end

  add_index "group_memberships", ["group_id"], name: "index_group_memberships_on_group_id", using: :btree
  add_index "group_memberships", ["group_name"], name: "index_group_memberships_on_group_name", using: :btree
  add_index "group_memberships", ["member_id", "member_type"], name: "index_group_memberships_on_member_id_and_member_type", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string "type"
  end

  create_table "media", force: :cascade do |t|
    t.string   "type"
    t.integer  "album_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "file_name"
    t.string   "file_type"
    t.string   "url"
    t.text     "legal_release_info"
    t.float    "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "caption"
    t.string   "credit"
    t.string   "s3_bucket_id"
    t.string   "xo_media_id"
    t.uuid     "uuid",               default: "uuid_generate_v4()"
  end

  add_index "media", ["album_id"], name: "index_media_on_album_id", using: :btree

  create_table "organization_albums", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "album_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "organization_albums", ["album_id"], name: "index_organization_albums_on_album_id", using: :btree
  add_index "organization_albums", ["organization_id"], name: "index_organization_albums_on_organization_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "type"
    t.string   "name"
    t.string   "web_address"
    t.string   "user_status"
    t.boolean  "referral"
    t.boolean  "watermark_preference"
    t.boolean  "watermark_preference_vendor"
    t.date     "activated_date"
    t.text     "terms_conditions"
    t.string   "twitter_id"
    t.string   "facebook_id"
    t.string   "linkedin_id"
    t.string   "esty_id"
    t.string   "instagram_id"
    t.string   "flickr_id"
    t.string   "pinterest_id"
    t.string   "vimeo_id"
    t.string   "google_plus_id"
    t.string   "youtube_id"
    t.string   "tumblr_id"
    t.string   "blog"
    t.string   "logo_required"
    t.string   "bio_description"
    t.integer  "established_when"
    t.uuid     "uuid",                        default: "uuid_generate_v4()"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "expiration_date"
    t.string   "email"
  end

  add_index "organizations", ["uuid"], name: "index_organizations_on_uuid", unique: true, using: :btree

  create_table "publications", force: :cascade do |t|
    t.string   "type"
    t.integer  "organization_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "name"
    t.uuid     "uuid",            default: "uuid_generate_v4()"
  end

  add_index "publications", ["organization_id"], name: "index_publications_on_organization_id", using: :btree
  add_index "publications", ["uuid"], name: "index_publications_on_uuid", unique: true, using: :btree

  create_table "published_albums", force: :cascade do |t|
    t.integer  "publication_id"
    t.integer  "album_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "published_albums", ["album_id"], name: "index_published_albums_on_album_id", using: :btree
  add_index "published_albums", ["publication_id"], name: "index_published_albums_on_publication_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "type"
    t.string   "phone_number"
    t.string   "email"
    t.integer  "album_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "subjects", ["album_id"], name: "index_subjects_on_album_id", using: :btree

  create_table "user_authorizations", force: :cascade do |t|
    t.string   "type"
    t.string   "token"
    t.string   "secret"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_authorizations", ["user_id"], name: "index_user_authorizations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                   null: false
    t.string   "encrypted_password",     default: "",                   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,                    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "type"
    t.string   "password_salt"
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "organization_id"
    t.uuid     "uuid",                   default: "uuid_generate_v4()"
    t.string   "auth_token"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  add_index "users", ["uuid"], name: "index_users_on_uuid", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
