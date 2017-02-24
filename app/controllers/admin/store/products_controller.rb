class Admin::Store::ProductsController < Store::Product::AdminController

  def new
    @store_shop_collection = Store::Shop::Collection.find params[:collection_id]
    @store_product = @store_shop_collection.store_products.new
    render
  end

  def create
    @store_shop_collection = Store::Shop::Collection.find params[:collection_id]
    @store_product = @store_shop_collection.store_products.new store_product_params
    if @store_product.save
      redirect_to admin_store_shop_collection_path(@store_shop_collection), notice: "Your product has been created!"
    else
      render 'new'
    end
  end

  private

    def store_product_params
      params.require(:store_product).permit(:name, :productable_id, :productable_type)
    end
end
