require 'rack/openid'

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :auth
  
  private
  def auth
    if identify?
      @auth = User.auth(session[:identity_url])
    end
  end
  
  def identify?
    session[:identity_url].present?
  end
  
  def login?
    @auth.present?
  end
end
