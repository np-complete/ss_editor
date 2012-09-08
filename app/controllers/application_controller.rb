require 'rack/openid'

class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def only_login
    access_controll(lambda{ user_signed_in? })
  end

  def only_not_login
    access_controll(lambda{ !user_signed_in? })
  end

  def access_controll(proc)
    proc.call ? true :  render('shared/access_failure')
  end
end
