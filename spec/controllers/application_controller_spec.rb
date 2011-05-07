# -*- coding: utf-8 -*-
require 'spec_helper'

describe ApplicationController do
  describe "#auth" do
    it "セッションに identity_url があったらUserを探す" do
      controller.session[:identity_url] = 'identity_url'
      User.should_receive(:auth).with('identity_url') { mock_user }
      controller.send(:auth)
      controller.instance_variable_get(:@auth).should eq(mock_user)
    end
    it "セッションに identity_url がなかったら何もしない" do
      controller.session[:identity_url] = nil
      User.should_not_receive(:auth)
      controller.send(:auth)
      controller.instance_variable_get(:@auth).should be_nil
    end
  end
  
  describe "#login?" do
    it "@authが設定されていたらtrue" do
      controller.instance_variable_set(:@auth, mock_user)
      controller.send(:login?).should be_true
    end
    it "@authが設定されていなかったらfalse" do
      controller.instance_variable_set(:@auth, nil)
      controller.send(:login?).should be_false
    end
  end
end
