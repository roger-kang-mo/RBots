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

ActiveRecord::Schema.define(:version => 20130603043926) do

  create_table "bots", :force => true do |t|
    t.string  "name"
    t.string  "bot_type"
    t.integer "post_count"
    t.integer "message_count"
    t.text    "description"
    t.boolean "account_created"
  end

  create_table "posts", :force => true do |t|
    t.string  "remote_id"
    t.text    "body"
    t.string  "subreddit"
    t.string  "time"
    t.integer "up"
    t.integer "downs"
    t.boolean "is_nsfw"
  end

  create_table "reddit_accounts", :force => true do |t|
    t.string  "remote_id"
    t.string  "name"
    t.integer "comment_karma"
    t.integer "link_karma"
    t.string  "created"
    t.boolean "is_mod"
    t.boolean "is_gold"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string  "name"
    t.boolean "likes_cats"
    t.boolean "likes_dogs"
    t.boolean "likes_sloths"
  end

end
