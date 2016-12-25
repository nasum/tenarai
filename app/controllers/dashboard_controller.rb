class DashboardController < ApplicationController
  layout "dashboard"

  def index
    @articles = Article.includes(:user).most_show_articles(current_user.id)
  end
end
