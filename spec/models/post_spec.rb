require 'rails_helper'

RSpec.describe Post, type: :model do
  
  let(:post) {create(:post)}
  
  it "assigns title" do
    expect(post.title).to eq "First Post"
  end

  it "assigns url" do
    expect(post.url).to eq "http://yahoo.com/rss"  
  end

  it "validates title presence" do
    expect{create(:post, title: nil)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "validates url uniqueness" do
    post
    expect{create(:post)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "validates url presence" do
    expect{create(:post, url: nil)}.to raise_error(ActiveRecord::RecordInvalid)  
  end
end
