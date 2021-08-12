class CreateChordProgressionChords < ActiveRecord::Migration[6.1]
  def change
    create_table :chord_progression_chords do |t|
      t.belongs_to :chord
      t.belongs_to :chord_progression

      t.timestamps
    end
  end
end
