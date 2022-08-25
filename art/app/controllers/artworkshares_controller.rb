class ArtworksSharesController < ApplicationController

    def create
        artworkshares = ArtworkShares.new(artwork_params)
      if artworkshares.save
        render json: artworkshares
      else
        render json: artworkshares.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
        artworkshares = ArtworkShares.find(params[:id])
        artworkshares.delete 
        render json: artworkshares
      end


      def artwork_params
        params.require(:artworkshare).permit(:artwork_id, :viewer_id)
      end

end 