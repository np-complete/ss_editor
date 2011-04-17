require "spec_helper"

describe DialogsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/stories/2/dialogs" }.should route_to(:controller => "dialogs", :action => "index", :story_id => "2")
    end

    it "recognizes and generates #new" do
      { :get => "/stories/2/dialogs/new" }.should route_to(:controller => "dialogs", :action => "new", :story_id => "2")
    end

    it "recognizes and generates #show" do
      { :get => "/stories/2/dialogs/1" }.should route_to(:controller => "dialogs", :action => "show", :id => "1", :story_id => "2")
    end

    it "recognizes and generates #edit" do
      { :get => "/stories/2/dialogs/1/edit" }.should route_to(:controller => "dialogs", :action => "edit", :id => "1", :story_id => "2")
    end

    it "recognizes and generates #create" do
      { :post => "/stories/2/dialogs" }.should route_to(:controller => "dialogs", :action => "create", :story_id => "2")
    end

    it "recognizes and generates #update" do
      { :put => "/stories/2/dialogs/1" }.should route_to(:controller => "dialogs", :action => "update", :id => "1", :story_id => "2")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/stories/2/dialogs/1" }.should route_to(:controller => "dialogs", :action => "destroy", :id => "1", :story_id => "2")
    end

  end
end
