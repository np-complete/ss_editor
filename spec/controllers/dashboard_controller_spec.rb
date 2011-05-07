# -*- coding: utf-8 -*-
require 'spec_helper'

describe DashboardController do
  describe "GET logout" do
    it "セッションが破棄される" do
      controller.session[:identity_url] = "sample@example.com"
      get :logout
      controller.session[:identity_url].should be_nil
    end
  end
end
