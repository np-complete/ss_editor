class DashboardController < ApplicationController
  def index
  end
  
  def login
    authenticate_with_open_id("https://www.google.com/accounts/o8/id") do |result, identity_url, registration|
      if result.successful?
        session[:identity_url] = identity_url
        redirect_to :controller => :dashboard
      else
        render :text => "Login failed: #{result.message}"
      end
    end
  end
  
  def logout
    session[:identity_url] = nil
    redirect_to root_url
  end
end
