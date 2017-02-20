class PagesController < ApplicationController
  def index
    @articles = Article.approved.paginate(:page => params[:page], :per_page => 5)
  end

  def articles
    @articles = Article.approved.paginate(:page => params[:page], :per_page => 10)
  end

  def article_show
    @article = Article.friendly.find params[:id]
  end

  def method
    #code
  end

  def crew
    #code
  end
end
