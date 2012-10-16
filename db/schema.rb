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

ActiveRecord::Schema.define(:version => 20121015232900) do

  create_table "comments", :force => true do |t|
    t.decimal  "user_id"
    t.text     "body"
    t.decimal  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "conversations" because of following StandardError
#   Unknown type 'array' for column 'users'

  create_table "conversations_users", :id => false, :force => true do |t|
    t.integer "conversation_id"
    t.integer "user_id"
  end

  add_index "conversations_users", ["conversation_id", "user_id"], :name => "index_conversations_users_on_conversation_id_and_user_id"
  add_index "conversations_users", ["user_id", "conversation_id"], :name => "index_conversations_users_on_user_id_and_conversation_id"

  create_table "messages", :force => true do |t|
    t.text     "content"
    t.integer  "conversation_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
  end

  create_table "posts", :force => true do |t|
    t.decimal  "user_id"
    t.text     "body"
    t.text     "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

end
