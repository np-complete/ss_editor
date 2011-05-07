class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :auth
  
  private
  def auth
    if session[:identity_url]
      @auth = User.auth(session[:identity_url])
    end
  end
  
  def login?
    @auth.present?
  end
end
