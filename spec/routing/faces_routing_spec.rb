require "spec_helper"

describe FacesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/faces" }.should route_to(:controller => "faces", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/faces/new" }.should route_to(:controller => "faces", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/faces/1" }.should route_to(:controller => "faces", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/faces/1/edit" }.should route_to(:controller => "faces", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/faces" }.should route_to(:controller => "faces", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/faces/1" }.should route_to(:controller => "faces", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/faces/1" }.should route_to(:controller => "faces", :action => "destroy", :id => "1")
    end

  end
end
