require "rails_helper"

describe SellersController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, {page: 1, format: :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index, {page: 1, format: :json}
      expect(response).to render_template("index")
    end

    it "loads all of the seller into @sellers" do
      seller1, seller2 =  FactoryGirl.create(:seller), FactoryGirl.create(:seller)
      get :index, {page: 1, format: :json}
      expect(assigns(:sellers)).to match_array([seller1, seller2])
    end
  end

  describe 'GET #items' do

    before :each do
      @seller = FactoryGirl.create(:seller)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :items, {page: 1, id: @seller.id, format: :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads all of the seller into @sellers" do
      item1 = FactoryGirl.create(:item, seller: @seller)
      item2 = FactoryGirl.create(:item, seller: @seller)
      get :items, {page: 1, id: @seller.id, format: :json}
      expect(assigns(:items)).to match_array([item1, item2])
    end
  end
end