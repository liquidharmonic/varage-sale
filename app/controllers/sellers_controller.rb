class SellersController < ApplicationController
  before_action :set_seller, only: [:items]

  # GET /sellers.json&page=1
  def index
    @sellers = Seller.paginate(:page => params[:page])
    respond_to do |format|
      format.json { render json: @sellers, status: 200}
    end
  end

  # GET /sellers/:id/items.json&page=1
  def items
    @items = @seller.items.paginate(:page => params[:page])
    respond_to do |format|
      format.json { render json: @items, status: 200}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seller_params
      params.require(:seller).permit(:name, :latitude, :longitude)
    end
end
