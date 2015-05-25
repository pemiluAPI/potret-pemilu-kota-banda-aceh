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

ActiveRecord::Schema.define(version: 20150513073739) do

  create_table "candidates", force: true do |t|
    t.integer "party_id"
    t.integer "region_category_id"
    t.string  "name"
    t.string  "gender"
    t.string  "address"
    t.string  "note"
    t.integer "valid_votes"
    t.boolean "elected"
    t.string  "ranked_valid_votes"
    t.string  "order_number"
  end

  add_index "candidates", ["party_id"], name: "index_candidates_on_party_id", using: :btree
  add_index "candidates", ["region_category_id"], name: "index_candidates_on_region_category_id", using: :btree

  create_table "dct_categories", force: true do |t|
    t.string "name"
    t.string "description"
    t.string "parent_id"
  end

  create_table "dct_recapitulations", force: true do |t|
    t.integer "region_id"
    t.integer "dct_category_id"
    t.string  "value"
  end

  add_index "dct_recapitulations", ["dct_category_id"], name: "index_dct_recapitulations_on_dct_category_id", using: :btree
  add_index "dct_recapitulations", ["region_id"], name: "index_dct_recapitulations_on_region_id", using: :btree

  create_table "dpts", force: true do |t|
    t.integer "region_id"
    t.string  "value"
    t.string  "category"
  end

  add_index "dpts", ["region_id"], name: "index_dpts_on_region_id", using: :btree

  create_table "parties", force: true do |t|
    t.string "name"
    t.string "full_name"
    t.string "chairman"
    t.string "secretary"
    t.string "treasurer"
    t.string "address"
  end

  create_table "party_votes", force: true do |t|
    t.integer "party_id"
    t.integer "value"
    t.string  "precentage"
  end

  add_index "party_votes", ["party_id"], name: "index_party_votes_on_party_id", using: :btree

  create_table "region_categories", force: true do |t|
    t.string "name"
    t.string "description"
  end

  create_table "regions", force: true do |t|
    t.integer "region_category_id"
    t.string  "name"
  end

  add_index "regions", ["region_category_id"], name: "index_regions_on_region_category_id", using: :btree

end
