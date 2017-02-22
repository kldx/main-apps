class Admin::ArticlesController < AdminController
  before_filter :set_user, only: [:index, :new, :create, :edit, :update, :destroy]
  before_filter :set_article, only: [:edit, :update, :destroy]
  before_filter :find_article, only:[:mark_approve, :mark_reject, :mark_pending]

  def index
    @articles = Article.all
  end

  def new
    @article ||= Article.new
    render
  end

  def create
    @article = @user.articles.new article_params
    if @article.save
      redirect_to admin_articles_path, notice: "Well done brah! Your article has been publish"
    else
      render 'new'
    end
  end

  def edit
    if @article
      render
    else
      redirect_to admin_articles_path, notice: "Oppss! Article not found"
    end
  end

  def update
    if @article.update article_params
      redirect_to admin_articles_path, notice: "Well done! Your article has been update"
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      redirect_to admin_articles_path, notice: 'Sorry! Article was destroyed!'
    else
      render 'index'
    end
  end

  def mark_approve
    @article.update_attributes(status: 1)
  end

  def mark_reject
    @article.update_attributes(status: 2)
  end

  def mark_pending
    @article.update_attributes(status: 0)
  end

  private

    def set_user
      @user = current_user
    end

    def article_params
      params.require(:article).permit(:user_id, :title, :description, :default_image, :default_image_cache, :status, :tag_list, :featured, :sponsored)
    end

    def set_article
      @article = Article.where(slug: params[:id], user: @user).take
    end

    def find_article
      @article = Article.friendly.find params[:id]
    end

end
