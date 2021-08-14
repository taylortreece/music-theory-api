class SongsController < ApplicationController
    def index
        @songs = Song.all
        render json: @songs
    end

    def show
        
    end

    def create
        binding.pry
    end

    def update

    end

    def delete

    end
end
