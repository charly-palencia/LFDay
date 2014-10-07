require 'rails_helper'

RSpec.describe "preferences/index.html.erb", :type => :view do
  describe "display table" do
    context "exists item" do
      assign(:preferences, [double(Preference), double(Preference)])

      render
      expect(view).to render_template(:partial => "_event", :count => 2)
    end

    context "dosnt exists item" do

    end
  end
end
