class DashboardController < ApplicationController
  def index
  end
  
  def login
  end
  
  def logout
    session[:identity_url] = nil
    redirect_to root_url
  end
end
