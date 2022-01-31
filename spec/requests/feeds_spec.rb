require 'rails_helper'

RSpec.describe "Feeds", type: :request do

  let(:feed) {create(:feed)}

  describe "GET /feeds" do
    it "returns status 200" do
      get feeds_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /feeds/:id" do
    it "returns status 200" do
      get feed_path(feed)
      expect(response).to have_http_status(200)  
    end

    it "renders template show" do
      get feed_path(feed)
      expect(response).to render_template(:show)  
    end
  end

  describe "POST /feeds" do
    it "creates a feed and redirects to index page" do
      post feeds_path(params: {feed: {title: "Test Title", url: "http://example.com"}})
      follow_redirect!
      expect(response).to render_template(:index)  
    end
  end

  describe "PATCH /feeds/:id" do
    it "renders show template" do
      patch feed_path(feed, params: {feed: {title: "Test Title"}})
      expect(response).to redirect_to(feed_path(feed))  
    end
  end
  
  describe "GET /feeds/new" do
    it "renders template new" do
      get new_feed_path
      expect(response).to render_template(:new)
    end
  end
  
  describe "DELETE /feeds/:id" do
    it "deletes feed" do
      delete feed_path(feed)
      expect{Feed.find(feed.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
