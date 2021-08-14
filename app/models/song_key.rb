class SongKey < ApplicationRecord
    belongs_to :song
    belongs_to :key
end
