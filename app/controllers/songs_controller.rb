class SongsController < ApplicationController
    def index
        songs = Song.all
        render json: songs.to_json(
            :include => [:scales, :chords,
                :keys => {
                    :include => {
                        :scales => {include: [
                            :notes, 
                            :chords => {include: [:notes]}
                        ]}
                    }
                }
            ]
        )
    end

    def show
        
    end

    def create
        Song.create_song_from_frontend(params)
    end

    def update
        song = Song.find_by(name: params[:name])
        chords = params[:chords].map{|chord| Chord.find_by(name: chord[:name])}
        song.update(chords: chords)
    end

    def delete
        Song.find_by(name: params[:name]).delete
    end

    private 

    def song_params
        params.require(:song).permit(:name, :key, :chords)
    end
    
    # def self.create_song_from_frontend(params)
    #     chords = params[:chords].map{ |chord| Chord.find_by(name: chord[:name])}
    #     song = Song.create(
    #         name: params[:song_name], 
    #         keys: [Key.find_by(name: params[:key_name], key_type: params[:key_type])], 
    #         chords: chords,
    #         scale: Scale.find_by(name: params[:name])
    #     )
    # end
end
