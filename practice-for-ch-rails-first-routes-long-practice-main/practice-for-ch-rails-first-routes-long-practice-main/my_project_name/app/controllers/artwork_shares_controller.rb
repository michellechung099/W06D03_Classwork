class ArtworkSharesController < ApplicationController
  def create
    shares = ArtworkShare.new(artwork_share_params)
    if shares && shares.save
      render json: shares, status: :created
    else
      render json: errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    id = params[:id]
    shares = ArtworkShare.find_by(id: id)
    if shares && shares.destroy
      render json: shares
    else
      render json: errors.full_messages, status: 404
    end
  end

  private
  def artwork_share_params
    params.require(:artwork_shares).permit(:artwork_id, :view_id)
  end
end
