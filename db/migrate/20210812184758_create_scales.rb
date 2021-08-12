class CreateScales < ActiveRecord::Migration[6.1]
  def change
    create_table :scales do |t|
      t.text :name
      t.text :scale_type
      t.text :degrees
      t.text :intervals

      t.timestamps
    end
  end
end
