FactoryGirl.define do
  factory :article do
    title "MyString"
    description "MyText"
    default_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'media', 'default-image.png')) }
    status 0
    user
    slug "MyString"
  end
end
