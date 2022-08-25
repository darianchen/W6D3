class ArtworkSharesController < ApplicationController

  def create
    artworkshares = ArtworkShares.new(artwork_shares_params)
    if artworkshares.save!
        render json: artworkshares
      else
        ender json: artworkshares.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artworkshares = ArtworkShares.find(params[:id])
    artworkshares.delete 
    render json: artworkshares
  end

  def artwork_shares_params
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
  end

end