# -*- coding: utf-8 -*-
require 'spec_helper'

describe DashboardController do
  describe "GET index" do
    describe "ログインしている場合" do
      it "render index" do
        controller.stub(:login?) { true }
        get :index
        response.should render_template(:index)
      end
    end
    
    describe "ログインしてないけどOAuth認証している場合" do
      it "users/new にリダイレクト" do
        controller.stub(:login?) { false }
        controller.stub(:identify?) { true }
        get :index
        response.should redirect_to(new_user_path)
      end
    end
    
    describe "ログインしてなくてOAuth認証もしていない場合" do
      it "root にリダイレクト" do
        controller.stub(:login?) { false }
        controller.stub(:identify?) { false }
        get :index
        response.should redirect_to(root_path)
      end
    end
  end
  describe "GET logout" do
    it "セッションが破棄される" do
      controller.session[:identity_url] = "sample@example.com"
      get :logout
      controller.session[:identity_url].should be_nil
    end
  end
end
