FactoryGirl.define do
  factory :article do
    title "MyString"
    description "MyText"
    default_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'media', 'default_image.jpg')) }
    status 0
    user
    slug "MyString"
  end
end
