class Admin::Store::ProductsController < Store::Product::AdminController
  before_filter :set_store_shop_collection, only: [:new, :create, :show, :edit, :update]
  before_filter :set_store_product, only: [:show, :edit, :update]

  def new
    @store_product = @store_shop_collection.store_products.new
    render
  end

  def create
    @store_product = @store_shop_collection.store_products.new store_product_params
    if @store_product.save
      redirect_to admin_store_shop_collection_path(@store_shop_collection), notice: "Your product has been created!"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    if @store_product
      render
    else
      redirect_to admin_store_shop_collection_path(@store_shop_collection), notice: "Oppss! Product not found"
    end
  end

  def update
    if @store_product.update store_product_params
      redirect_to admin_store_shop_collection_path(@store_shop_collection), notice: "Your product has been update"
    else
      render 'edit'
    end
  end

  private

    def set_store_product
      @store_product = @store_shop_collection.store_products.friendly.find params[:id]
    end

    def set_store_shop_collection
      # get store_shop_collection id from url: http://main-apps.dev/master/store/shop/collections/55
      @store_shop_collection = Store::Shop::Collection.find params[:collection_id]
    end

    def store_product_params
      params.require(:store_product).permit(:name, :productable_id, :productable_type, :details, :price, :status, :availability, :default_picture, :default_picture_cache, :quantity, :product_type, :product_id, :slug)
    end
end
