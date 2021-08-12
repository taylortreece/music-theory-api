class ScaleNote < ApplicationRecord
    belongs_to :scale
    belongs_to :note
end