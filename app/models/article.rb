class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  include ArticleSearchable

  def author
    self.user.name
  end

  def show_count
    REDIS.zscore "articles/#{self.user.id}", self.id
  end

  def self.most_show_articles(user_id)
    self.find REDIS.zrevrangebyscore "articles/#{user_id}", "+inf", 0, limit: [0, 5]
  end
end
