class CreateChords < ActiveRecord::Migration[6.1]
  def change
    create_table :chords do |t|
      t.text :name
      t.text :accidental
      t.text :chord_type

      t.timestamps
    end
  end
end