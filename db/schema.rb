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

ActiveRecord::Schema.define(version: 20_200_508_203_811) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'courses', force: :cascade do |t|
    t.string 'title'
    t.text 'shortDescription'
    t.string 'url'
    t.string 'imgUrl'
    t.float 'providerRatings'
    t.string 'duration'
    t.string 'provider'
    t.string 'author'
    t.string 'level'
    t.string 'medium'
    t.string 'language'
    t.string 'category'
    t.string 'broad_category'
    t.text 'tags'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'favorites', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'course_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
