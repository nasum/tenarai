class ArticlesController < ApplicationController
  layout "article"

  before_action :set_article, only: [:edit, :show, :update, :destroy]

  def index
    @articles = ArticleDecorator.decorate_collection(Article.where(user: current_user).page(1).per(10).order("created_at DESC"))
    render layout: "dashboard"
  end

  def new
    @article = Article.new(user: current_user)
  end

  def edit
  end

  def show
  end

  def create
    @article = current_user.articles.create(article_params(params))
    render action: :show
  end

  def update
    if @article.update_attributes(article_params(params))
      render action: :show
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
    params.require(:article).permit([:content])
  end
end
