class Feed < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
end