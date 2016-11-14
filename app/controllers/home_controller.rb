class HomeController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    @articles = Admin::Article.page(1).per(10).order("created_at DESC")
  end
end
