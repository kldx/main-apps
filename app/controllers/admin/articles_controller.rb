class Admin::ArticlesController < AdminController
  def index
    @articles = Article.all
  end

  def new
    @article ||= Article.new
    render
  end

  def create
    #code
  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private


end
