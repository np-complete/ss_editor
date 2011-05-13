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
  
  describe "#identify?" do
    it "セッションに identity_url があれば true" do
      controller.session[:identity_url] = 'identity_url'
      controller.send(:identify?).should be_true
    end
    it "セッションに identity_url がなければ false" do
      controller.session[:identity_url] = nil
      controller.send(:identify?).should be_false
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
  
  describe "#only_login" do
    it "login? がfalse ならエラー画面" do
      controller.stub(:login?) { false }
      controller.should_receive(:render).with('shared/access_failure')
      controller.send(:only_login).should
    end
    it "login? がtrueなら trueを返す" do
      controller.stub(:login?) { true }
      controller.send(:only_login).should
    end
  end
  
  describe "#only_login" do
    it "login? がtrue ならエラー画面" do
      controller.stub(:login?) { true }
      controller.should_receive(:render).with('shared/access_failure')
      controller.send(:only_not_login).should
    end
    it "login? がfalseなら trueを返す" do
      controller.stub(:login?) { false }
      controller.send(:only_not_login).should
    end
    
  end
  
  describe "#access_controll" do
    it "proc がfalseならエラー画面" do
      controller.should_receive(:render).with('shared/access_failure')
      controller.send(:access_controll, lambda{ false })
    end
  end
end
