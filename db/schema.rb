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

ActiveRecord::Schema.define(version: 20150928095608) do

  create_table "addition_histories", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "new_book_id", limit: 4
    t.boolean  "status"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "addition_histories", ["new_book_id"], name: "index_addition_histories_on_new_book_id", using: :btree
  add_index "addition_histories", ["user_id"], name: "index_addition_histories_on_user_id", using: :btree

  create_table "additions", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "new_book_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "additions", ["new_book_id"], name: "index_additions_on_new_book_id", using: :btree
  add_index "additions", ["user_id"], name: "index_additions_on_user_id", using: :btree

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "author_name", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "book_reservations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "book_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "book_reservations", ["book_id"], name: "index_book_reservations_on_book_id", using: :btree
  add_index "book_reservations", ["user_id"], name: "index_book_reservations_on_user_id", using: :btree

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "book_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "bookmarks", ["book_id"], name: "index_bookmarks_on_book_id", using: :btree
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.date     "published_at"
    t.integer  "author_id",    limit: 4
    t.integer  "publisher_id", limit: 4
    t.integer  "genre_id",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree
  add_index "books", ["genre_id"], name: "index_books_on_genre_id", using: :btree
  add_index "books", ["publisher_id"], name: "index_books_on_publisher_id", using: :btree

  create_table "borrowing_histories", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "stock_id",    limit: 4
    t.datetime "borrowed_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "borrowing_histories", ["stock_id"], name: "index_borrowing_histories_on_stock_id", using: :btree
  add_index "borrowing_histories", ["user_id"], name: "index_borrowing_histories_on_user_id", using: :btree

  create_table "borrowings", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "stock_id",   limit: 4
    t.datetime "return_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "borrowings", ["stock_id"], name: "index_borrowings_on_stock_id", using: :btree
  add_index "borrowings", ["user_id"], name: "index_borrowings_on_user_id", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "genre_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "new_books", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "author",     limit: 255
    t.string   "publisher",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "publisher_name", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "book_id",    limit: 4
    t.string   "content",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "reviews", ["book_id"], name: "index_reviews_on_book_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "stock_reservations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "stock_id",   limit: 4
    t.datetime "invalid_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "stock_reservations", ["stock_id"], name: "index_stock_reservations_on_stock_id", using: :btree
  add_index "stock_reservations", ["user_id"], name: "index_stock_reservations_on_user_id", using: :btree

  create_table "stocks", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "stocks", ["book_id"], name: "index_stocks_on_book_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255, default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addition_histories", "new_books"
  add_foreign_key "addition_histories", "users"
  add_foreign_key "additions", "new_books"
  add_foreign_key "additions", "users"
  add_foreign_key "book_reservations", "books"
  add_foreign_key "book_reservations", "users"
  add_foreign_key "bookmarks", "books"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "books", "authors"
  add_foreign_key "books", "genres"
  add_foreign_key "books", "publishers"
  add_foreign_key "borrowing_histories", "stocks"
  add_foreign_key "borrowing_histories", "users"
  add_foreign_key "borrowings", "stocks"
  add_foreign_key "borrowings", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
  add_foreign_key "stock_reservations", "stocks"
  add_foreign_key "stock_reservations", "users"
  add_foreign_key "stocks", "books"
end
