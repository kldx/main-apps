class Admin::ArticlesController < AdminController
  before_filter :set_user, only: [:index, :new, :create, :edit, :update, :destroy]
  before_filter :set_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article ||= Article.new
    render
  end

  def create
    @article = @user.articles.new(article_params)
    if @article.save
      redirect_to admin_articles_path, notice: "Well done brah! Your article has been publish"
    else
      render 'new'
    end
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

    def set_user
      @user = current_user
    end

    def article_params
      params.require(:article).permit(:user_id, :title, :description, :default_image, :default_image_cache, :status, :tag_list)
    end

    def set_article
      @article = Article.where(slug: params[:id], user: @user).take
    end

end
