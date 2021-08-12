class CreateChordNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :chord_notes do |t|
      t.belongs_to :chord
      t.belongs_to :note

      t.timestamps
    end
  end
end
