require 'rails_helper'

RSpec.describe PlayController, :type => :controller do

  describe "GET play" do
    it "returns http success" do
      get :play
      expect(response).to be_success
    end
  end

end
