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

ActiveRecord::Schema.define(version: 20180328053234) do

  create_table "job_defines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "worker_type"
    t.string "job_class"
    t.string "report_code"
    t.string "name"
    t.boolean "system_only"
    t.boolean "mutual_exclusion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_parameters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "job_define_id"
    t.integer "seq"
    t.string "code"
    t.string "name"
    t.string "parameter_type"
    t.string "default_value"
    t.integer "lookup_sort_id"
    t.string "hardcode"
    t.boolean "show_flag"
    t.string "lookup_relation"
    t.string "lookup_model"
    t.string "lookup_model_key"
    t.string "lookup_model_value"
    t.string "relation_filter"
    t.boolean "required"
    t.boolean "allow_all"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lookup_sorts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "sort"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lookups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "lookup_sort_id"
    t.string "code"
    t.string "name"
    t.string "description"
    t.string "tag"
    t.date "start_on"
    t.date "end_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
