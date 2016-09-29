require 'rails_helper'

RSpec.describe Article, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:article)).to be_valid
  end

  describe 'when user field the form with correct information' do

    it "should be valid when article belongs to a user" do
      expect(FactoryGirl.build(:article, user: User.first)).to be_valid
    end

    it "should be valid with title" do
      expect(FactoryGirl.build(:article, title: "title")).to be_valid
    end

    it "should be valid with description" do
      expect(FactoryGirl.build(:article, description: "description")).to be_valid
    end

    it "should be valid with description" do
      expect(FactoryGirl.build(:article, description: "description")).to be_valid
    end

    it "should be valid with default image" do
      expect(FactoryGirl.build(:article, default_image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'media', 'default-image.png')))).to be_valid
    end

  end

  describe "when user field the form with incorrect information" do

    it "should be invalid without title" do
      expect(FactoryGirl.build(:article, title: nil)).not_to be_valid
    end

    it "should be invalid with short title" do
      expect(FactoryGirl.build(:article, title: "A")).not_to be_valid
    end

    it "should be invalid with long title" do
      expect(FactoryGirl.build(:article, title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna diam, posuere nec lacinia a, posuere in lacus. Duis cursus nulla sapien, ac eleifend magna iaculis quis. Vestibulum suscipit a enim quis tristique. Curabitur volutpat ultrices enim. Nam eu facilisis lorem. Etiam justo nulla, ornare ut commodo at, vehicula id mauris. Aliquam pharetra rhoncus orci, posuere posuere neque euismod non. Nam in egestas nibh. Mauris semper non sem et ultricies. Duis vitae lacinia ex, vel viverra leo. Nulla magna diam, ultrices a sem at, ullamcorper pulvinar sem. Quisque sit amet enim nibh. Aenean non sapien tincidunt, imperdiet leo quis, sollicitudin leo. Proin maximus, neque non sagittis finibus, erat sem sodales risus, in sagittis mauris ante vel metus. Etiam ut lobortis augue, et dapibus ante. Nulla quis odio vestibulum, molestie nisi eget, viverra mi.")).not_to be_valid
    end

    it "should be invalid without default image" do
      expect(FactoryGirl.build(:article, default_image: nil)).not_to be_valid
    end

    it "should be invalid without description" do
      expect(FactoryGirl.build(:article, description: nil)).not_to be_valid
    end

  end
end
