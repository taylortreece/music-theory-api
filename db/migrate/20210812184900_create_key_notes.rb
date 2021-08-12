class CreateKeyNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :key_notes do |t|
      t.belongs_to :key
      t.belongs_to :note

      t.timestamps
    end
  end
end
