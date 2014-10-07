class PreferencesController < ApplicationController
  before_action :authenticate_user!
  def index
    @preferences = Preference.all
  end

  def new
    @preference = Preference.new
  end
  def create
    @preference = Preference.new(params_preference)
    @preference.user_id = current_user.id
    respond_to do |format|
      if @preference.save
        format.html{ redirect_to preferences_path }
      else
        render 'new'
      end
    end
  end
  private
    def params_preference
      params.require(:preference).permit(:like, :dislike)
    end
end
