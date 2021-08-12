class ScaleChordProgression < ApplicationRecord
    belongs_to :scale
    belongs_to :chord_progression
end
