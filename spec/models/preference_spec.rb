require 'rails_helper'

RSpec.describe Preference, :type => :model do
  describe "Validations" do
    describe "like and dislike" do
      context "when be valids" do
        let(:preference) { FactoryGirl.build(:preference) }
        it { expect(preference.valid?).to eql(true) }
      end
    end
    describe "like" do
      context "when be nil" do
        let(:preference) { FactoryGirl.build(:preference, like: nil) }
        it "" do
          preference.valid?
          expect(preference.errors[:like]).to include("can't be blank")
        end
      end
      context "when be long" do
        let(:preference) { FactoryGirl.build(:preference, like: "a"*300) }
        it {expect(preference.valid?).to eql false}
      end
    end

    describe "dislike" do
      context "when be nil" do
        let(:preference) { FactoryGirl.build(:preference, dislike: nil) }
        it "" do
          preference.valid?
          expect(preference.errors[:dislike]).to include("can't be blank")
        end
      end
      context "when be long" do
        let(:preference) { FactoryGirl.build(:preference, dislike: "a"*300) }
        it {expect(preference.valid?).to eql false}
      end
    end
  end
end
