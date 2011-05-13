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
  
  def only_login
    access_controll(lambda{ login? })
  end
  
  def only_not_login
    access_controll(lambda{ !login? })
  end
  
  def access_controll(proc)
    render 'shared/access_failure' unless proc.call
  end
end
