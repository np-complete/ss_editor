# -*- coding: utf-8 -*-
require 'spec_helper'

describe UsersController do
  describe "GET index" do
    let!(:users) { FactoryGirl.create_list(:user, 3) }
    it "assigns all users as @users" do
      get :index
      assigns(:users).should == users
    end
  end

  describe "GET show" do
    let(:user) { FactoryGirl.create(:user) }
    it "assigns the requested user as @user" do
      get :show, :id => user.id
      assigns(:user).should == user
    end
  end

  describe "GET new" do
    before { controller.stub(:user_signed_in?).and_return(false) }

    it "assigns a new user as @user" do
      User.stub(:new).and_return(:new_user)
      get :new
      assigns(:user).should == :new_user
    end
  end

  describe "GET edit" do
    let(:user) { FactoryGirl.create(:user) }
    context :user_signed_in do
      before { sign_in user }
      it "assigns the requested user as @user" do
        get :edit, :id => user.id + 1
        assigns(:user).should == user
      end
    end
  end

  describe "POST create" do
    before { controller.session[:identity_url] = 'authauth' }

    context :sined_in do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }
      it "エラー" do
        User.should_not_receive(:new)
        post :create
        response.should render_template('shared/access_failure')
      end
    end

    describe "with valid params" do
      let!(:new_user) { FactoryGirl.build(:user) }
      before do
        User.stub(:new).and_return(new_user)
        User.any_instance.stub(:save).and_return(true)
      end
      it "assigns a newly created user as @user" do
        User.stub(:new).with({'these' => 'params'}).and_return(new_user)
        new_user.should_receive(:openid_url=).with('authauth')
        post :create, :user => {'these' => 'params'}
        assigns(:user).should == new_user
      end

      it "redirects to the created user" do
        post :create, :user => {}
        response.should redirect_to([new_user])
      end
    end

    describe "with invalid params" do
      before { User.any_instance.stub(:save).and_return(false) }
      it "not saved" do
        post :create, :user => {}
        assigns(:user).should be_a_new_record
      end
      it "re-renders the 'new' template" do
        post :create, :user => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user }
    describe "with valid params" do
      before { User.any_instance.stub(:update_attributes).and_return(true) }

      it "assigns the current_user as @user" do
        put :update, :id => user.id + 1
        assigns(:user).should == user
      end

      it "updates the user" do
        controller.stub(:current_user).and_return(user)
        user.should_receive(:update_attributes).with({'these' => 'params'}).and_return(true)
        put :update, :id => user.id, :user => {'these' => 'params'}
      end

      it "redirects to the user" do
        put :update, :id => user.id
        response.should redirect_to([user])
      end
    end

    describe "with invalid params" do
      before { User.any_instance.stub(:update_attributes).and_return(false) }

      it "re-renders the 'edit' template" do
        put :update, :id => user.id
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
  end

end
