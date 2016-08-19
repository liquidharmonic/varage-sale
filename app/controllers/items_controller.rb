class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  # GET /items
  # GET /items.json
  def index
    @items = Item.paginate(:page => params[:page])
    respond_to do |format|
      format.json { render json: @items, status: 200}
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    respond_to do |format|
      format.json { render json: @item, status: 200}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end
end
