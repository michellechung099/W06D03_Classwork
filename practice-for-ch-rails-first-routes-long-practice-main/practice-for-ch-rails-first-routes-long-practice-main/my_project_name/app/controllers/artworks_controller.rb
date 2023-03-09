class ArtworksController < ApplicationController
    def index
        artworks = Artwork.all 
        render json: artworks
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork, status: :created
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        incoming_wildcard = params[:id]
        artwork = Artwork.find_by(id: incoming_wildcard)
        if artwork
            render json: artwork
        else
            render json: user.errors.full_messages, status: 404
        end
    end

    def update
        incoming_wildcard = params[:id]
        artwork = Artwork.find_by(id: incoming_wildcard)
        if artwork && artwork.update(artwork_params)
            render json: artwork
        else
            render json: user.errors.full_messages, status: 404
        end
    end

    def destroy
        incoming_wildcard = params[:id]
        artwork = Artwork.find_by(id: incoming_wildcard)
        if artwork && artwork.destroy
            render json: artwork
        else
            render json: user.errors.full_messages, status: 404
        end
    end

    private

    def artwork_params
        params.require(:artwork).permit(:artist_id, :title, :image_url)
    end
end
