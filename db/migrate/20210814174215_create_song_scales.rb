class CreateSongScales < ActiveRecord::Migration[6.1]
  def change
    create_table :song_scales do |t|
      t.belongs_to :song
      t.belongs_to :scale

      t.timestamps
    end
  end
end
