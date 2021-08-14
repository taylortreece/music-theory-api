class CreateSongChords < ActiveRecord::Migration[6.1]
  def change
    create_table :song_chords do |t|
      t.belongs_to :chord
      t.belongs_to :song

      t.timestamps
    end
  end
end
