require 'rails_helper'

RSpec.describe Feed, type: :model do

  let(:feed) {create(:feed)}
  
  it "assigns title" do
    expect(feed.title).to eq "Yahoo Feed"  
  end

  it "assigns url" do
    expect(feed.url).to eq "http://yahoo.com/rss"  
  end

  it "validates title presence" do
    expect{create(:feed, title: nil)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "validates url uniqueness" do
    feed
    expect{create(:feed)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "validates url presence" do
    expect{create(:feed, url: nil)}.to raise_error(ActiveRecord::RecordInvalid)  
  end
end
