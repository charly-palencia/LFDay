require 'rails_helper'

RSpec.describe Player, :type => :model do
  describe Player, "Mehtods" do
    # Lo tengo mal testeado debo corregirlo. Hay que ser mas especifico
    describe "#play" do
      context 'with 2 users' do
        subject(:friend_secret) { Player.new.play(@current_user.id) }
        before(:each) do
          @current_user = FactoryGirl.create(:user)
        end
        it "it should return name of my secret friend" do
          other = FactoryGirl.create(:user, id: 2, email: "other@other.com", name: "OtherPlayer")
          expect(friend_secret).to match other.name
        end

        it "it should return false if secret friends are not available" do
          expect(friend_secret).to match false
        end
      end      
    end

    describe "#available_users" do
      context 'with 2 users' do
        subject(:available_users) { @player.available_users }
        before(:each) do
          current_user = FactoryGirl.create(:user)
          @player = Player.new
          @player.set_id_user(current_user.id)
        end
        it "should return array with available users" do
          other = FactoryGirl.create(:user, id: 2, email: "other@other.com")
          expect(available_users).to eql [other.id]
        end

        it "do not return any users" do
          expect(available_users).to eql []
        end        
      end
    end

    describe "#played?" do
      let(:user) { FactoryGirl.create(:user) }
      let(:player) { Player.new }
      subject(:played) { player.played? }
      before(:each) do
        FactoryGirl.create(:user, id: 2, email: "other@other.com")        
      end
      context 'when return true' do
        before(:each) do
          player.play(user.id)
        end
        it { expect(played).to eql true }
      end
      context 'when return false' do
        before(:each) do
          player.set_id_user(user.id)
        end
        it { expect(played).to eql false }
      end
    end
  end
end