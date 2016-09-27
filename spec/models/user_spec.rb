require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  describe 'when user field the form with correct information' do

    it "should be valid with an email" do
      expect(FactoryGirl.build(:user, email: "test@example.com")).to be_valid
    end

    it "should be valid with a unique email" do
      expect(FactoryGirl.build(:user, email: "test@example.com")).to be_valid
    end

    it "should be valid with an callsign" do
      expect(FactoryGirl.build(:user, callsign: "9w2pdf")).to be_valid
    end

    it "should be valid with a unique callsign" do
      expect(FactoryGirl.build(:user, callsign: "9w2pdf")).to be_valid
    end

    it "should be valid with a password" do
      expect(FactoryGirl.build(:user, password: "secret123")).to be_valid
    end

  end

  describe "when user field the form with incorrect information" do

    it "should be invalid without a email" do
      expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
    end

    it "should be invalid without a unique email" do
      expect(User.find_or_create_by(email: :email)).not_to be_valid
    end

    it "should be invalid without a callsign" do
      expect(FactoryGirl.build(:user, callsign: nil)).not_to be_valid
    end

    it "should be invalid without a unique callsign" do
      expect(User.find_or_create_by(callsign: :callsign)).not_to be_valid
    end

    it "should be invalid without a password" do
      expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
    end

  end
end
