class FeedsController < ApplicationController

  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @feeds = Feed.all.order(created_at: :desc)
  end

  def new
    @feed = Feed.new
  end

  def edit
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.save
    redirect_to feeds_path
  end

  def update
    @feed.update(feed_params)
    redirect_to feed_path(@feed)
  end

  def destroy
    @feed.destroy
    redirect_to feeds_path
  end

  private

  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:title, :url)
  end
end