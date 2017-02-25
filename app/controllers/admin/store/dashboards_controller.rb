class Admin::Store::DashboardsController < Store::Product::AdminController
  def index
    @store_shop_collection = Store::Shop::Collection.all
    @store_merchandise_collection = Store::Merchandise::Collection.all
    @store_shop_product = Store::Product.where(productable_type: "Store::Shop::Collection")
    @store_merchandise_product = Store::Product.where(productable_type: "Store::Merchandise::Collection")
  end
end
