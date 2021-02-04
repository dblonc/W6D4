require "byebug"
class ArtworksController < ApplicationController
    
    def index
        lists = Artwork.all
        render json: lists
    end

    def create
        # binding.pry
        artwork = Artwork.new(strong_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity #422
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: person
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(strong_params)
            redirect_to artwork_url(artwork)
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        redirect_to artwork_url
    end

    private

    def strong_params
        params.require(:artwork).permit(:title,:image_url,:artist_id)
    end

end