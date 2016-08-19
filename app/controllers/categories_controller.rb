class CategoriesController < ApplicationController
  before_action :set_category, only: [:items_available]

  # GET /categories.json
  def index
    @categories = Category.paginate(:page => params[:page])
    respond_to do |format|
      format.json { render json: @categories, status: 200}
    end
  end

  # GET /categories/:id/items_available.json&page=1
  def items_available
    @items = @category.items.available.paginate(:page => params[:page])
    respond_to do |format|
      format.json { render json: @items, status: 200}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
