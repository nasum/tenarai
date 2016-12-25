class UserArticlesController < ApplicationController
  before_action :set_user
  skip_before_action :require_login

  def index
    @articles = @user.articles.page(1).per(10).order("created_at DESC")
  end

  def show
    @article = @user.articles.find(params[:id])
    increment_daily_ranking
    increment_article_show_count
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by name: params[:user_name].gsub(/@/, '')
    end

    def increment_daily_ranking
      REDIS.zincrby "articles/daily/#{Date.today.to_s}", 1, @article.id
    end

    def increment_article_show_count
      REDIS.zincrby "articles/#{@user.id}", 1, @article.id
    end
end
