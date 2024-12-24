class ArticlesController < ApplicationController

  def index
    @articles = params[:q].present? ? Article.search(params[:q]) : Article.all
  end
end
