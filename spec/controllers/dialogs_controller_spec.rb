# -*- coding: utf-8 -*-
require 'spec_helper'

describe DialogsController do
  before do
    Story.stub(:find) { mock_story }
  end
  
  describe "GET index" do
    it "assigns all dialogs as @dialogs" do
      mock_story.stub(:dialogs) { [mock_dialog] }
      get :index, :story_id => "2"
      assigns(:dialogs).should eq([mock_dialog])
    end
  end
  
  describe "PUT update_orders" do
    it "@story should recieve update_dialog_orders!" do
      mock_story.should_receive(:update_dialog_orders!).with([1,2,3,4]) { true }
      put :update_orders, :story_id => "2", :dialogs => ["1","2","3","4"]
    end
    describe "success" do
      it "render 'ok'" do
        mock_story.stub(:update_dialog_orders!) { true }
        put :update_orders, :story_id => "2", :dialogs => []
        response.body.should eq("ok")
      end
    end
    
    describe "failure" do
      it "render 'ng'" do
        mock_story.stub(:update_dialog_orders!) { false }
        put :update_orders, :story_id => "2", :dialogs => []
        response.body.should eq("ng")
      end
    end
  end

  describe "GET show" do
    it "assigns the requested dialog as @dialog" do
      mock_story.stub_chain(:dialogs, :find).with("37") { mock_dialog }
      get :show, :id => "37", :story_id => "2"
      assigns(:dialog).should be(mock_dialog)
    end
  end

  describe "GET new" do
    it "assigns a new dialog as @dialog" do
      mock_story.stub_chain(:dialogs, :new) { mock_dialog }
      get :new, :story_id => "2"
      assigns(:dialog).should be(mock_dialog)
    end
  end

  describe "GET edit" do
    it "assigns the requested dialog as @dialog" do
      mock_story.stub_chain(:dialogs, :find).with("37") { mock_dialog }
      get :edit, :id => "37", :story_id => "2"
      assigns(:dialog).should be(mock_dialog)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created dialog as @dialog" do
        mock_story.stub_chain(:dialogs, :new).with({'these' => 'params'}) { mock_dialog(:save => true) }
        post :create, :dialog => {'these' => 'params'}, :story_id => "2"
        assigns(:dialog).should be(mock_dialog)
      end

      it "redirects to the created dialog" do
        mock_story.stub_chain(:dialogs, :new) { mock_dialog(:save => true) }
        post :create, :dialog => {}, :story_id => "2"
        response.should redirect_to(story_dialog_url(mock_story, mock_dialog))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dialog as @dialog" do
        mock_story.stub_chain(:dialogs, :new).with({'these' => 'params'}) { mock_dialog(:save => false) }
        post :create, :dialog => {'these' => 'params'}, :story_id => "2"
        assigns(:dialog).should be(mock_dialog)
      end

      it "re-renders the 'new' template" do
        mock_story.stub_chain(:dialogs, :new) { mock_dialog(:save => false) }
        post :create, :dialog => {}, :story_id => "2"
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested dialog" do
        mock_story.stub_chain(:dialogs, :find).with("37") { mock_dialog }
        mock_dialog.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :dialog => {'these' => 'params'}, :story_id => "2"
      end

      it "assigns the requested dialog as @dialog" do
        mock_story.stub_chain(:dialogs, :find) { mock_dialog(:update_attributes => true) }
        put :update, :id => "1", :story_id => "2"
        assigns(:dialog).should be(mock_dialog)
      end

      it "redirects to the dialog" do
        mock_story.stub_chain(:dialogs, :find) { mock_dialog(:update_attributes => true) }
        put :update, :id => "1", :story_id => "2"
        response.should redirect_to(story_dialog_url(mock_story, mock_dialog))
      end
    end

    describe "with invalid params" do
      it "assigns the dialog as @dialog" do
        mock_story.stub_chain(:dialogs, :find) { mock_dialog(:update_attributes => false) }
        put :update, :id => "1", :story_id => "2"
        assigns(:dialog).should be(mock_dialog)
      end

      it "re-renders the 'edit' template" do
        mock_story.stub_chain(:dialogs, :find) { mock_dialog(:update_attributes => false) }
        put :update, :id => "1", :story_id => "2"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested dialog" do
      mock_story.stub_chain(:dialogs, :find).with("37") { mock_dialog }
      mock_dialog.should_receive(:destroy)
      delete :destroy, :id => "37", :story_id => "2"
    end

    it "redirects to the dialogs list" do
      mock_story.stub_chain(:dialogs, :find) { mock_dialog }
      delete :destroy, :id => "1", :story_id => "2"
      response.should redirect_to(story_dialogs_url(mock_story))
    end
  end
  
  describe "GET change_faces" do
    describe "character_id が指定された場合" do
      it "character_idの顔一覧が@facesにアサインされる" do
        Character.stub(:find).with("37") {
          mock_character(:faces => [mock_face(:name => "Hoge")])
        }
        xhr :get, :change_faces, :story_id => "2", :character_id => "37"
        assigns[:faces].should eq([mock_face])
      end
    end
    
    describe "character_id が指定されてない場合" do
      it "空の配列が@facesにアサインされる" do
        xhr :get, :change_faces, :story_id => "2", :character_id => ""
        assigns[:faces].should eq([])
      end
    end
  end
end
