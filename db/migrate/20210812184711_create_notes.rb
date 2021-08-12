class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :name
      t.text :accidental
      t.integer :pitch

      t.timestamps
    end
  end
end
