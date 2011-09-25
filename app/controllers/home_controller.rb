class HomeController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_profile

  def check_profile
    if current_user && current_user.profile.blank?
      flash[:notice] = "Please Create your profile first!"
      redirect_to :controller => "profiles", :action => "new"
    end
  end
  
end
