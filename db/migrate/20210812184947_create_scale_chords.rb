class CreateScaleChords < ActiveRecord::Migration[6.1]
  def change
    create_table :scale_chords do |t|
      t.belongs_to :scale
      t.belongs_to :chord

      t.timestamps
    end
  end
end
