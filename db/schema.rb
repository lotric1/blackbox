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

ActiveRecord::Schema.define(version: 2020_06_07_000230) do

  create_table "bbox_contents", force: :cascade do |t|
    t.string "text"
    t.datetime "insertion_date"
    t.datetime "completion_date"
    t.datetime "due_date"
    t.boolean "completed"
    t.boolean "pinned"
    t.integer "pass_counter"
    t.integer "bbox_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bbox_id"], name: "index_bbox_contents_on_bbox_id"
  end

  create_table "bboxes", force: :cascade do |t|
    t.string "title"
    t.datetime "creation_date"
    t.integer "position"
    t.integer "items_per_day"
    t.boolean "starred"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "noteboxes", force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.datetime "creation_date"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bbox_contents", "bboxes"
end
