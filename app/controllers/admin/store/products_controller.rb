class Admin::Store::ProductsController < Store::Product::AdminController
  before_filter :set_store_shop_collection, only: [:new, :create]

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

  private

    def set_store_shop_collection
      # get store_shop_collection id from url: http://main-apps.dev/master/store/shop/collections/55
      @store_shop_collection = Store::Shop::Collection.find params[:collection_id]
    end

    def store_product_params
      params.require(:store_product).permit(:name, :productable_id, :productable_type, :details, :price, :status, :availability, :default_picture, :default_picture_cache, :quantity, :product_type, :product_id, :slug)
    end
end
