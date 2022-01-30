require 'rails_helper'

RSpec.describe FeedsController, type: :controller do

  let(:feed) {create(:feed)}

  describe "GET index" do
    it "assigns @feeds" do
      feed
      get :index
      expect(assigns(:feeds)).to eq Feed.all.order(created_at: :desc)  
    end
  end

  describe "GET show" do
    it "assigns @feed" do
      get :show, params: {id: feed.id}
      expect(assigns(:feed)).to eq feed  
    end
  end

  describe "GET new" do
    it "assigns @feed" do
      get :new
      expect(assigns(:feed)).to be_a_new Feed
    end
  end

  describe "GET edit" do
    it "assigns @feed" do
      get :edit, params: {id: feed.id}
      expect(assigns(:feed)).to eq feed  
    end
  end

  describe "POST create" do
    it "assigns @feed" do
      post :create, params: {feed: {title: "Test Feed", url: "http://example.com"}}
      expect(assigns(:feed).title).to eq "Test Feed"
      expect(assigns(:feed).url).to eq "http://example.com"
    end
  end

  describe "PATCH update" do
    it "assigns @feed" do
      patch :update, params: {feed: {title: "Test Feed"}, id: feed.id}
      expect(assigns(:feed).title).to eq "Test Feed"
    end
  end

  describe "DELETE destroy" do
    it "assigns @feed" do
      delete :destroy, params: {id: feed.id}
      expect(assigns(:feed)).to eq feed  
    end
  end
  
end