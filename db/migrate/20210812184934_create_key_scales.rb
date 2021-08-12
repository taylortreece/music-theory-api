class CreateKeyScales < ActiveRecord::Migration[6.1]
  def change
    create_table :key_scales do |t|
      t.belongs_to :key
      t.belongs_to :scale

      t.timestamps
    end
  end
end
