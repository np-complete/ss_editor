# -*- coding: utf-8 -*-
require 'spec_helper'

describe DialogsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:story) { FactoryGirl.create(:story, user: user) }

  before do
    sign_in user
    Story.stub(:find) { story }
    controller.stub(:check_my_story) { true }
  end

  describe "GET index" do
    let!(:dialogs) { FactoryGirl.create_list(:dialog, 3, story: story) }
    it "assigns all dialogs as @dialogs" do
      Dialog.should_receive(:new).with(story: story).and_return :new_dialog

      get :index, :story_id => story.id
      assigns(:dialogs).should == dialogs
      assigns(:dialog).should == :new_dialog
    end
  end

  describe "PUT update_orders" do
    it "@story should recieve update_dialog_orders!" do
      put :update_orders, :story_id => story.id, :dialogs => ["1","2","3","4"]
      assigns[:story].should == story
    end

    describe "success" do
      before { Story.any_instance.stub(:update_dialog_orders!).and_return(true) }
      it "render 'ok'" do
        story.stub(:update_dialog_orders!) { true }
        put :update_orders, :story_id => story.id, :dialogs => []
        response.body.should == "ok"
      end
    end

    describe "failure" do
      before { Story.any_instance.stub(:update_dialog_orders!).and_return(false) }
      it "render 'ng'" do
        put :update_orders, :story_id => story.id, :dialogs => []
        response.body.should == "ng"
      end
    end
  end

  describe "GET show" do
    let(:dialog) { FactoryGirl.create(:dialog, story: story) }
    it "assigns the requested dialog as @dialog" do
      get :show, :id => dialog.id, :story_id => story.id
      assigns(:dialog).should == dialog
    end
  end

  describe "GET new" do
    let(:dialog) { FactoryGirl.build(:dialog, story: story) }
    it "assigns a new dialog as @dialog" do
      Story.any_instance.stub_chain(:dialogs, :new).and_return(dialog)
      get :new, :story_id => story.id
      assigns(:dialog).should == dialog
    end
  end

  describe "GET edit" do
    let(:dialog) { FactoryGirl.create(:dialog, story: story) }
    it "assigns the requested dialog as @dialog" do
      get :edit, :id => dialog.id, :story_id => story.id
      assigns(:dialog).should == dialog
    end
  end

  describe "POST create" do
    let!(:new_dialog) { FactoryGirl.build(:dialog) }
    before do
      Dialog.any_instance.stub(:save).and_return(true)
      Dialog.stub(:new).and_return(new_dialog)
    end
    describe "with valid params" do
      it "assigns a newly created dialog as @dialog" do
        Dialog.should_receive(:new).with({'these' => 'params'}).and_return(new_dialog)
        new_dialog.should_receive(:story=).with(story)
        post :create, :dialog => {'these' => 'params'}, :story_id => story.id
        assigns(:dialog).should == new_dialog
      end

      it "redirects to dialogs list" do
        post :create, :dialog => {}, :story_id => story.id
        response.should redirect_to([story, :dialogs])
      end
    end

    describe "with invalid params" do
      before { Dialog.any_instance.stub(:save).and_return(false) }
      it "assigns a newly created but unsaved dialog as @dialog" do
        post :create, :dialog => {}, :story_id => story.id
        assigns(:dialog).should == new_dialog
        assigns(:dialog).should be_new_record
      end

      it "re-renders the 'new' template" do
        post :create, :dialog => {}, :story_id => story.id
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    let(:dialog) { FactoryGirl.create(:dialog, story: story) }
    describe "with valid params" do
      before { Dialog.any_instance.stub(:update_attributes).and_return(true) }
      it "updates the requested dialog" do
        Dialog.any_instance.should_receive(:update_attributes).with('these' => 'params')
        put :update, :id => dialog.id, :story_id => story.id, :dialog => {'these' => 'params'}
        assigns(:dialog).should == dialog
      end

      it "redirects to the dialogs list" do
        put :update, :id => dialog.id, :story_id => story.id, :dialog => {}
        response.should redirect_to([story, :dialogs])
      end
    end

    describe "with invalid params" do
      before { Dialog.any_instance.stub(:update_attributes).and_return(false) }
      it "assigns the dialog as @dialog" do
        put :update, :id => dialog.id, :story_id => story.id
        assigns(:dialog).should == dialog
      end

      it "re-renders the 'edit' template" do
        put :update, :id => dialog.id, :story_id => story.id
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let(:dialog) { FactoryGirl.create(:dialog, story: story) }
    it "destroys the requested dialog" do
      Dialog.any_instance.should_receive(:destroy)
      delete :destroy, :id => dialog.id, :story_id => story.id
    end

    it "redirects to the dialogs list" do
      delete :destroy, :id => dialog.id, :story_id => story.id
      response.should redirect_to([story, :dialogs])
    end
  end

  describe "GET change_faces" do
    let(:character) { FactoryGirl.create(:character) }
    describe "character_id が指定された場合" do
      it "character_idの顔一覧が@facesにアサインされる" do
        xhr :get, :change_faces, :story_id => story.id, :character_id => character.id
        assigns[:faces].should == character.faces
      end
    end

    describe "character_id が指定されてない場合" do
      it "空の配列が@facesにアサインされる" do
        xhr :get, :change_faces, :story_id => story.id, :character_id => ""
        assigns[:faces].should eq([])
      end
    end
  end
end
