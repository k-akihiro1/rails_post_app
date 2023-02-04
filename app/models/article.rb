class Article < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :user
  has_many :tag_articles
  has_many :tag_articles, through: :tag_articles
end
