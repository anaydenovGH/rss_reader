class CollectPostsJob < ApplicationJob
  queue_as :default

  def perform
    Feed.all.each do |feed|
      xml = HTTParty.get(feed.url).body
      feed_content = Feedjira.parse(xml)
      feed_content.entries.each do |entry|
        Post.find_or_create_by(title: entry.title, url: entry.url)
      end
    end
  end
end
