# -*- coding: utf-8 -*-
require 'spec_helper'

describe CharactersController do
  describe "GET index" do
    let!(:characters) { FactoryGirl.create_list(:character, 3) }
    it "assigns all characters as @characters" do
      get :index
      assigns(:characters).should == characters
    end
  end

  describe "GET show" do
    let(:character) { FactoryGirl.create(:character) }
    it "assigns the requested character as @character" do
      get :show, :id => character.id
      assigns(:character).should == character
    end
  end

  describe "GET new" do
    it "assigns a new character as @character" do
      get :new
      assigns(:character).should be_a Character
    end
  end

  describe "GET edit" do
    it "NoMethodError" do
      lambda {
        get :edit, :id => ""
      }.should raise_error(NoMethodError)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      let!(:new_character) { FactoryGirl.build(:character) }
      before do
        Character.any_instance.stub(:save).and_return(true)
        Character.stub(:new).and_return(new_character)
      end

      it "assigns a newly created character as @character" do
        Character.should_receive(:new).with({'these' => 'params'}).and_return(new_character)
        post :create, :character => {'these' => 'params'}
        assigns(:character).should == new_character
      end

      it "redirects to the created character" do
        post :create, :character => {}
        response.should redirect_to([new_character])
      end
    end

    describe "with invalid params" do
      before { Character.any_instance.stub(:save).and_return(false) }

      it "re-renders the 'new' template" do
        post :create, :character => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    it "NoMethodError" do
      lambda {
        put :update, :id => "", :character => {}
      }.should raise_error(NoMethodError)
    end
  end

  describe "DELETE destroy" do
    it "NoMethodError" do
      lambda {
        delete :destory, :id => ""
      }.should raise_error(NoMethodError)
    end
  end
end
