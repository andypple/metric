# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_01_075428) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "metric_infos", force: :cascade do |t|
    t.datetime "timestamp_value", null: false
    t.string "name"
    t.decimal "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.virtual "day", type: :date, as: "date(timestamp_value)", stored: true
    t.virtual "hour", type: :integer, as: "EXTRACT(hour FROM timestamp_value)", stored: true
    t.virtual "minute", type: :integer, as: "EXTRACT(minute FROM timestamp_value)", stored: true
    t.index ["day"], name: "index_metric_infos_on_day"
    t.index ["hour"], name: "index_metric_infos_on_hour"
    t.index ["minute"], name: "index_metric_infos_on_minute"
  end

end
