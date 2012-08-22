# -*- coding: utf-8 -*-
require 'spec_helper'

describe DashboardController do
  let(:user) { FactoryGirl.create(:user) }
  describe "GET index" do
    context "ログインしている場合" do
      let(:stories) { FactoryGirl.create_list(:story, 5, user: user) }
      before { sign_in user }

      it "render index" do
        get :index
        response.should render_template(:index)
      end

    end

    context "ログインしていない場合" do
      it "root にリダイレクト" do
        get :index
        response.should redirect_to(root_path)
      end
    end
  end

  describe "GET logout" do
    before { sign_in user }
    it "ログアウトする" do
      lambda {
        get :logout
      }.should change(controller, :user_signed_in?).from(true).to(false)
    end
  end
end
