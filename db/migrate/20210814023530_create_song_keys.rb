class CreateSongKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :song_keys do |t|
      t.belongs_to :key
      t.belongs_to :song
      
      t.timestamps
    end
  end
end
