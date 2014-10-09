require 'rails_helper'

RSpec.describe Player, :type => :model do
  describe Player, "Mehtods" do
    describe "#play" do
      subject(:friend_secret) { Player.new.play(@current_user.id) }
      context "it should return name of my secret friend" do
        before(:each) do
          @current_user = FactoryGirl.create(:user)
          @other = FactoryGirl.create(:user, id: 2, email: "other@other.com", name: "OtherPlayer")
        end
        it { expect(friend_secret).to match @other.name }
      end

      context "it should return false if secret friends are not available" do
        before(:each) do
          @current_user = FactoryGirl.create(:user)
        end
        it { expect(friend_secret).to match false }
      end
    end
  end
end