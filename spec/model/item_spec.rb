require "rails_helper"

describe Item, :type => :model do
  describe 'validation' do
    subject { FactoryGirl.build(:item) }

    it 'is valid if every attribute is valid' do
      expect(subject).to be_valid
    end
    it 'is invalid if seller dne' do
      subject.seller = nil
      expect(subject).to be_invalid
    end
    it 'is invalid if category dne' do
      subject.category = nil
      expect(subject).to be_invalid
    end
    it 'is invalid if status is not restricted value' do
      subject.status = 'random'
      expect(subject).to be_invalid
    end
  end
  # describe "GET #index" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :index
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end

  #   it "renders the index template" do
  #     get :index
  #     expect(response).to render_template("index")
  #   end

  #   it "loads all of the posts into @posts" do
  #     post1, post2 = Post.create!, Post.create!
  #     get :index

  #     expect(assigns(:posts)).to match_array([post1, post2])
  #   end
  # end
end