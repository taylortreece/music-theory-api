class Note < ApplicationRecord
    has_many :key_notes
    has_many :keys, through: :key_notes
    has_many :chord_notes
    has_many :chords, through: :chord_notes
    has_many :scale_notes
    has_many :scales, through: :scale_notes
end
