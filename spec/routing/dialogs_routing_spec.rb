require "spec_helper"

describe DialogsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/dialogs" }.should route_to(:controller => "dialogs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/dialogs/new" }.should route_to(:controller => "dialogs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/dialogs/1" }.should route_to(:controller => "dialogs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/dialogs/1/edit" }.should route_to(:controller => "dialogs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/dialogs" }.should route_to(:controller => "dialogs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/dialogs/1" }.should route_to(:controller => "dialogs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/dialogs/1" }.should route_to(:controller => "dialogs", :action => "destroy", :id => "1")
    end

  end
end
