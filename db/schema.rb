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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140401192158) do

  create_table "activities", :force => true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "activities", ["owner_id", "owner_type"], :name => "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], :name => "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], :name => "index_activities_on_trackable_id_and_trackable_type"

  create_table "announcements", :force => true do |t|
    t.text     "message"
    t.integer  "user_id"
    t.integer  "batch_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "announcements", ["batch_id"], :name => "index_announcements_on_batch_id"
  add_index "announcements", ["user_id"], :name => "index_announcements_on_user_id"

  create_table "assets", :force => true do |t|
    t.integer  "assetable_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "afile_file_name"
    t.string   "afile_content_type"
    t.integer  "afile_file_size"
    t.datetime "afile_updated_at"
    t.string   "assetable_type"
  end

  add_index "assets", ["assetable_id"], :name => "index_assets_on_assetable_id"

  create_table "batches", :force => true do |t|
    t.string   "name"
    t.string   "date_start"
    t.string   "date_end"
    t.integer  "department_id"
    t.integer  "active"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "batches", ["department_id"], :name => "index_batches_on_department_id"

  create_table "chat_tokens", :force => true do |t|
    t.string   "token"
    t.integer  "owner_id"
    t.integer  "recipient_id"
    t.integer  "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "chats", :force => true do |t|
    t.text     "content"
    t.integer  "owner_id"
    t.text     "recipient_ids"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.integer  "institute_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "departments", ["institute_id"], :name => "index_departments_on_institute_id"

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "batch_id"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "docfile_file_name"
    t.string   "docfile_content_type"
    t.integer  "docfile_file_size"
    t.datetime "docfile_updated_at"
  end

  add_index "documents", ["batch_id"], :name => "index_documents_on_batch_id"
  add_index "documents", ["user_id"], :name => "index_documents_on_user_id"

  create_table "institutes", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "contact_number"
    t.string   "contact_person"
    t.string   "contact_email"
    t.text     "address"
    t.integer  "year_estd"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "role_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "contact_number"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "batch_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
