class ChordProgression < ApplicationRecord
    has_many :chord_progression_chords
    has_many :chords, through: :chord_progression_chords
    has_many :scale_chord_progressions
    has_many :scales, through: :scale_chord_progressions
end