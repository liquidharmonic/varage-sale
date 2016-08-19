require "rails_helper"

describe ItemsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully 200 & returns items" do
      item1 = FactoryGirl.create(:item)
      item2 = FactoryGirl.create(:item) 
      get :index, {page: 1, format: :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:items)).to match_array([item1, item2])
    end
  end

  describe 'GET #items/:id' do

    before :each do
      @item = FactoryGirl.create(:item)
    end

    context 'id matches item' do
      it "responds successfully with 200 & returns json of item" do
        get :show, {page: 1, id: @item.id, format: :json}
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response.body).to eql ItemSerializer.new(@item).to_json
      end
    end
    context 'id does not match item' do
      it 'responds with 400' do
        get :show, {page: 1, id: 'i_do_not_exist', format: :json}
        expect(response).to_not be_success
        expect(response).to have_http_status(400)
      end
    end
  end
end