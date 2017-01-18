class HomeController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    @articles = if params[:search]
      Article.includes(:user).search(params[:search]).page(1).per(10).records
    else
      Article.includes(:user).page(1).per(10)
    end
  end
end
