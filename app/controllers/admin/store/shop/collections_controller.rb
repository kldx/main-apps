class Admin::Store::Shop::CollectionsController < Store::Shop::Collection::AdminController
  def index
    @store_shop_collections ||= Store::Shop::Collection.all
  end

  def new
    @store_shop_collection ||= Store::Shop::Collection.new
    render
  end

  def create
    @store_shop_collection = Store::Shop::Collection.new shop_collection_params
    if @store_shop_collection.save
      redirect_to admin_store_shop_collections_path, notice: "Your shop collection has been created!"
    else
      render 'new'
    end
  end

  def show
    @store_shop_collection = Store::Shop::Collection.find params[:id]
    @response = Billplz::GetCollection.retrieve(@store_shop_collection.collection_id)
    @store_product = @store_shop_collection.store_products
  end

  private

    def shop_collection_params
      params.require(:store_shop_collection).permit(:title, :status, :collection_id)
    end
end
