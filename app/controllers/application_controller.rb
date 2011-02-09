class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
  
  def login_required
    redirect_to :login unless current_user    
  end
end
