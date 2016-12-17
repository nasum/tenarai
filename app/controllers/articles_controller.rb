class ArticlesController < ApplicationController
  layout "article"

  before_action :set_article, only: [:edit, :show, :update, :destroy]

  def index
    @articles = Article.where(user: current_user).page(1).per(10).order("created_at DESC")
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
    @article = current_user.articles.new(article_params(params))

    if @article.save
      flash.now[:success] = "create an article"
      render action: :show
    else
      flash.now[:danger] = "could not create an article"
      render action: :new
    end
  end

  def update
    if @article.update_attributes(article_params(params))
      flash.now[:success] = "edit an article"
      render action: :show
    else
      flash.now[:danger] = "could not edit an article"
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

  def preview
    render text: view_context.markdown(params[:article])
  end

  private

  def set_article
    @article = current_user.articles.find params[:id]
  end

  def article_params(params)
    params.require(:article).permit([:title,:content])
  end
end
