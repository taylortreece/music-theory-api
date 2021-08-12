class CreateScaleNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :scale_notes do |t|
      t.belongs_to :scale
      t.belongs_to :note

      t.timestamps
    end
  end
end
