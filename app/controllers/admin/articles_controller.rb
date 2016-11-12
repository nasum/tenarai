class Admin::ArticlesController < ApplicationController
  layout "admin"

  before_action :set_article, only: [:edit, :show, :update, :destroy]

  def index
    @articles = Admin::Article.page(1).per(10).order("created_at DESC")
  end

  def new
    @article = Admin::Article.new(user: current_user)
    render layout: "article"
  end

  def edit
    render layout: "article"
  end

  def show
    render layout: "article"
  end

  def create
    @article = current_user.articles.create(article_params(params))
    render action: :show, layout: "article"
  end

  def update
    if @article.update_attributes(article_params(params))
      render action: :show, layout: "article"
    else
      render action: :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to action: :index
    else
      redirect_to action: :edit
    end
  end

  private

  def set_article
    @article = current_user.articles.find params[:id]
  end

  def article_params(params)
    params.require(:admin_article).permit([:content])
  end
end
