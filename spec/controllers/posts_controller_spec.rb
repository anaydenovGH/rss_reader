require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET index" do
    it "assigns @posts" do
      create(:post)
      get :index
      expect(assigns(:posts)).to eq Post.all.order(created_at: :desc)  
    end
  end
end