class Song < ApplicationRecord
    has_many :song_keys
    has_many :keys, through: :song_keys
    has_many :song_chords
    has_many :chords, through: :song_chords
    has_many :song_scales
    has_many :scales, through: :song_scales

    def Song.create_song_from_frontend(params)
        chords = params[:chords].map{ |chord| Chord.find_by(name: chord[:name])}
        song = Song.create(
            name: params[:song_name], 
            keys: [Key.find_by(name: params[:key_name], key_type: params[:key_type])], 
            chords: chords,
            scales: [Scale.find_by(name: params[:song_scale])]
        )
    end
end
