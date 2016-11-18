class UserArticlesController < ApplicationController
  before_action :set_user
  skip_before_action :require_login, only: :index

  def index
    @articles = @user.articles.page(1).per(10).order("created_at DESC")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by name: params[:user_name].gsub(/@/, '')
    end
end
