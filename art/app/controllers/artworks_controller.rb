# app/controllers/artworks_controller.rb

class ArtworksController < ApplicationController
    def index
        artwork = artworks_for_user_id(params[:id])
        artwork_shared = artwork_shared(params[:id])
        render :json => {:artwork => artwork, :artwork_shared => artwork_shared}
    end
  
    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end
  
    def show
        render json: Artwork.find(params[:id])
    end
  
    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end
      
    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end
  
    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

    def artworks_for_user_id(user_id)
        Artwork
            .select(:id, :title, :image_url, :artist_id)
            .where('artist_id = ?', user_id)
    end

    def artwork_shared_to_user(user_id)
        Artwork
            .select(:id, :title, :image_url, :artist_id)
            .joins(:artwork_shares)
            .where('viewer_id = ?', user_id )
    end 
  end