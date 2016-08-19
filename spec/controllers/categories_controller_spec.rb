require "rails_helper"

describe CategoriesController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with 200 & returns all categories" do
      category1 = FactoryGirl.create(:category)
      category2 = FactoryGirl.create(:category)
      get :index, {page: 1, format: :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:categories)).to match_array([category1, category2])
      expect(response.body).to eql [category1, category2].to_json
    end
  end

  describe 'GET #items_available' do

    before :each do
      @category = FactoryGirl.create(:category)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :items_available, {page: 1, id: @category.id, format: :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads all of the category into @categories" do
      item1 = FactoryGirl.create(:item, category: @category)
      item2 = FactoryGirl.create(:item, category: @category)
      get :items_available, {page: 1, id: @category.id, format: :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:items)).to match_array([item1, item2])
      item_1_serialized = ItemSerializer.new(item1)
      item_2_serialized = ItemSerializer.new(item2)
      expect(response.body).to eql [item_1_serialized, item_2_serialized].to_json
    end

    it 'returns blank if there are no items available in the category' do
      item1 = FactoryGirl.create(:item, :sold, category: @category)
      item2 = FactoryGirl.create(:item, :sold, category: @category)
      get :items_available, {page: 1, id: @category.id, format: :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:items)).to match_array([])
      expect(JSON.parse(response.body)).to be_empty
    end
  end
end