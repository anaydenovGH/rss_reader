class FeedsController < ApplicationController

  def show
    @feed = Feed.find(params[:id])
  end

  def index
    @feeds = Feed.all
  end
end