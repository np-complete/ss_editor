require 'spec_helper'

describe DashboardController do
  describe "routing" do
    it "recognize and generates #index" do
      { :get => "/dashboard" }.should route_to(:controller => "dashboard", :action => "index")
    end
    
    it "recognize and generates #login" do
      { :get => "/login" }.should route_to(:controller => "dashboard", :action => "login")
    end
    
    it "recognize and generates #logout" do
      { :get => "/logout" }.should route_to(:controller => "dashboard", :action => "logout")
    end
  end
end
