class Admin::ArticlesController < ApplicationController
  layout "admin"

  def index
    @articles = Admin::Article.page(1).per(10)
  end

  def new
    render layout: "article"
  end

  def edit
    render layout: "article"
  end

  def show
  end

  def create
  end

  def destroy
  end
end
