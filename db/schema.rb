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

ActiveRecord::Schema.define(version: 2021_08_14_023547) do

  create_table "chord_notes", force: :cascade do |t|
    t.integer "chord_id"
    t.integer "note_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chord_id"], name: "index_chord_notes_on_chord_id"
    t.index ["note_id"], name: "index_chord_notes_on_note_id"
  end

  create_table "chord_progression_chords", force: :cascade do |t|
    t.integer "chord_id"
    t.integer "chord_progression_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chord_id"], name: "index_chord_progression_chords_on_chord_id"
    t.index ["chord_progression_id"], name: "index_chord_progression_chords_on_chord_progression_id"
  end

  create_table "chords", force: :cascade do |t|
    t.text "name"
    t.text "accidental"
    t.text "chord_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "key_notes", force: :cascade do |t|
    t.integer "key_id"
    t.integer "note_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["key_id"], name: "index_key_notes_on_key_id"
    t.index ["note_id"], name: "index_key_notes_on_note_id"
  end

  create_table "key_scales", force: :cascade do |t|
    t.integer "key_id"
    t.integer "scale_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["key_id"], name: "index_key_scales_on_key_id"
    t.index ["scale_id"], name: "index_key_scales_on_scale_id"
  end

  create_table "keys", force: :cascade do |t|
    t.text "name"
    t.text "accidental"
    t.text "key_type"
    t.integer "primary_scale_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text "name"
    t.text "accidental"
    t.integer "pitch"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scale_chord_progressions", force: :cascade do |t|
    t.integer "scale_id"
    t.integer "chord_progression_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chord_progression_id"], name: "index_scale_chord_progressions_on_chord_progression_id"
    t.index ["scale_id"], name: "index_scale_chord_progressions_on_scale_id"
  end

  create_table "scale_chords", force: :cascade do |t|
    t.integer "scale_id"
    t.integer "chord_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chord_id"], name: "index_scale_chords_on_chord_id"
    t.index ["scale_id"], name: "index_scale_chords_on_scale_id"
  end

  create_table "scale_notes", force: :cascade do |t|
    t.integer "scale_id"
    t.integer "note_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["note_id"], name: "index_scale_notes_on_note_id"
    t.index ["scale_id"], name: "index_scale_notes_on_scale_id"
  end

  create_table "scales", force: :cascade do |t|
    t.text "name"
    t.text "scale_type"
    t.text "degrees"
    t.text "intervals"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "song_chords", force: :cascade do |t|
    t.integer "chord_id"
    t.integer "song_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chord_id"], name: "index_song_chords_on_chord_id"
    t.index ["song_id"], name: "index_song_chords_on_song_id"
  end

  create_table "song_keys", force: :cascade do |t|
    t.integer "key_id"
    t.integer "song_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["key_id"], name: "index_song_keys_on_key_id"
    t.index ["song_id"], name: "index_song_keys_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
