require "rails_helper"

describe SellersController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with 200 status code & returns all sellers" do
      seller1 = FactoryGirl.create(:seller)
      seller2 = FactoryGirl.create(:seller) 
      get :index, {page: 1, format: :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:sellers)).to match_array([seller1, seller2])
      expect(response.body).to eql [seller1, seller2].to_json
    end
  end

  describe 'GET #items_sold' do

    before :each do
      @seller = FactoryGirl.create(:seller)
    end

    it "returns only sold items" do
      item1 = FactoryGirl.create(:item, :sold, seller: @seller)
      item2 = FactoryGirl.create(:item, :sold, seller: @seller)
      item3 = FactoryGirl.create(:item, :available, seller: @seller)
      get :items_sold, {page: 1, id: @seller.id, format: :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:items)).to match_array([item1, item2])
      item_1_serialized = ItemSerializer.new(item1)
      item_2_serialized = ItemSerializer.new(item2)
      expect(response.body).to eql [item_1_serialized, item_2_serialized].to_json
    end

    it 'returns blank if there are no sold items for the seller' do
      item1 = FactoryGirl.create(:item, :available, seller: @seller)
      item2 = FactoryGirl.create(:item, :available, seller: @seller)
      item3 = FactoryGirl.create(:item, :available, seller: @seller)
      get :items_sold, {page: 1, id: @seller.id, format: :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:items)).to match_array([])
      expect(JSON.parse(response.body)).to be_empty
    end
  end
end