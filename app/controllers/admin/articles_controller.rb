class Admin::ArticlesController < ApplicationController
  layout "admin"

  def index
    @articles = Admin::Article.page(1).per(10).order("created_at DESC")
  end

  def new
    @article = Admin::Article.new(user: current_user)
    render layout: "article"
  end

  def edit
    @article = Admin::Article.find params[:id]
    render layout: "article"
  end

  def show
    @article = Admin::Article.find params[:id]
  end

  def create
    @article = current_user.articles.create(article_params(params))
    render action: :show, layout: "article"
  end

  def update
    @article = Admin::Article.find params[:id]
    if @article.update_attributes(article_params(params))
      render action: :show, layout: "article"
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def article_params(params)
    params.require(:admin_article).permit([:content])
  end
end
