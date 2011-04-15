require "spec_helper"

describe FacesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/characters/1/faces" }.should route_to(:controller => "faces", :action => "index", :character_id => "1")
    end

    it "recognizes and generates #new" do
      { :get => "/characters/1/faces/new" }.should route_to(:controller => "faces", :action => "new", :character_id => "1")
    end

    it "recognizes and generates #show" do
      { :get => "/characters/1/faces/1" }.should route_to(:controller => "faces", :action => "show", :id => "1", :character_id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/characters/1/faces/1/edit" }.should route_to(:controller => "faces", :action => "edit", :id => "1", :character_id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/characters/1/faces" }.should route_to(:controller => "faces", :action => "create", :character_id => "1")
    end

    it "recognizes and generates #update" do
      { :put => "/characters/1/faces/1" }.should route_to(:controller => "faces", :action => "update", :id => "1", :character_id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/characters/1/faces/1" }.should route_to(:controller => "faces", :action => "destroy", :id => "1", :character_id => "1")
    end

  end
end
