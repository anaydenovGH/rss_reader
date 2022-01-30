class FeedsController < ApplicationController

  def show
    @feed = Feed.find(params[:id])
  end

  def index
    @feeds = Feed.all.order(created_at: :desc)
  end

  def new
    @feed = Feed.new
  end

  def edit
    @feed = Feed.find(params[:id])
  end

  def create
    @feed = Feed.new(params.require(:feed).permit(:title, :url))
    @feed.save
    redirect_to feeds_path
  end

  def update
    @feed = Feed.find(params[:id])
    @feed.update(params.require(:feed).permit(:title, :url))
    redirect_to feed_path(@feed)
  end

  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    redirect_to feeds_path
  end
end