require "rails_helper"

describe ItemsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, {page: 1, format: :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads all of the category into @categorys" do
      item1, item2 =  FactoryGirl.create(:item), FactoryGirl.create(:item)
      get :index, {page: 1, format: :json}
      expect(assigns(:items)).to match_array([item1, item2])
    end
  end

  describe 'GET #items/:id' do

    before :each do
      @item = FactoryGirl.create(:item)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :show, {page: 1, id: @item.id, format: :json}
      expect(response).to be_success
      debugger
      expect(response).to have_http_status(200)
    end
  end
end