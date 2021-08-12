class CreateScaleChordProgressions < ActiveRecord::Migration[6.1]
  def change
    create_table :scale_chord_progressions do |t|
      t.belongs_to :scale
      t.belongs_to :chord_progression

      t.timestamps
    end
  end
end
