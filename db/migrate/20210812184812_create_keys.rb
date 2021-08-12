class CreateKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :keys do |t|
      t.text :name
      t.text :accidental
      t.text :key_type
      t.integer :primary_scale_id

      t.timestamps
    end
  end
end
