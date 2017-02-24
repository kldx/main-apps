class PagesController < ApplicationController
  def index
    @articles = Article.all
    @all_articles = @articles.been_approved.take(7)
    @approved_articles = @all_articles.shift(6)

    @sponsored_article = @articles.sponsored.been_approved.take(1)
    @top_sponsored_article = @sponsored_article.shift(1)

    @featured_articles = @articles.been_approved.featured.take(3)
    @all_featured_articles = @featured_articles.shift(3)

    # listing for store shop collection and products
    @store_products = Store::Product.been_approved
  end

  def articles
    @articles = Article.been_approved.paginate(:page => params[:page], :per_page => 10)
  end

  def article_show
    @article = Article.friendly.find params[:id]
    @random_article = Article.been_approved.take(4)

    url = "https://graph.facebook.com/?id=" + article_show_url(@article, host: "#{Settings.domain}")
    @response = HTTParty.get(url)
    @fbshares = @response["shares"] || 0
  end

  def method
    #code
  end

  def crew
    #code
  end
end
