class HomeController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    @articles = Article.includes(:user).search(search_params).page(1).per(10).records
  end

  private

  def search_params
    if params[:search]
      params[:search]
    else
      '*'
    end
  end
end
