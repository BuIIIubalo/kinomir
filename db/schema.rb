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

ActiveRecord::Schema[7.0].define(version: 2022_02_27_104024) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoryships", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categoryships_on_category_id"
    t.index ["movie_id"], name: "index_categoryships_on_movie_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genreships", force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_genreships_on_genre_id"
    t.index ["movie_id"], name: "index_genreships_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "kp_id"
    t.string "imdb_id"
    t.string "poster_url"
    t.string "trailer_url"
    t.string "iframe_url"
    t.string "name_ru"
    t.string "name_en"
    t.text "description"
    t.integer "year"
    t.integer "film_length"
    t.integer "box_office_world"
    t.float "rating_kp"
    t.float "rating_imdb"
    t.boolean "recomended"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categoryships", "categories"
  add_foreign_key "categoryships", "movies"
  add_foreign_key "genreships", "genres"
  add_foreign_key "genreships", "movies"
end
