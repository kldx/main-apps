FactoryGirl.define do
  factory :store_product, class: 'Store::Product' do
    store_shop_collection nil
  end
end
