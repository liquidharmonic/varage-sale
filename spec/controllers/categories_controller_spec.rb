require "rails_helper"

describe CategoriesController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, {page: 1, format: :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads all of the category into @categorys" do
      category1, category2 =  FactoryGirl.create(:category), FactoryGirl.create(:category)
      get :index, {page: 1, format: :json}
      expect(assigns(:categories)).to match_array([category1, category2])
    end
  end

  describe 'GET #items' do

    before :each do
      @category = FactoryGirl.create(:category)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :items, {page: 1, id: @category.id, format: :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "loads all of the category into @categories" do
      item1 = FactoryGirl.create(:item, category: @category)
      item2 = FactoryGirl.create(:item, category: @category)
      get :items, {page: 1, id: @category.id, format: :json}
      expect(assigns(:items)).to match_array([item1, item2])
    end
  end
end