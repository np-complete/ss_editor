# -*- coding: utf-8 -*-
require 'spec_helper'

describe ApplicationController do
  describe "#only_login" do
    it "user_signed_in? がfalse ならエラー画面" do
      controller.stub(:user_signed_in?) { false }
      controller.should_receive(:render).with('shared/access_failure')
      controller.send(:only_login).should_not be_true
    end
    it "user_signed_in? がtrueなら trueを返す" do
      controller.stub(:user_signed_in?) { true }
      controller.send(:only_login).should be_true
    end
  end

  describe "#only_not_login" do
    it "user_sinend_in? がtrue ならエラー画面" do
      controller.stub(:user_signed_in?) { true }
      controller.should_receive(:render).with('shared/access_failure')
      controller.send(:only_not_login).should_not be_true
    end
    it "user_signed_in? がfalseなら trueを返す" do
      controller.stub(:user_signed_in?) { false }
      controller.send(:only_not_login).should be_true
    end
  end

  describe "#access_controll" do
    it "proc がfalseならエラー画面" do
      controller.should_receive(:render).with('shared/access_failure')
      controller.send(:access_controll, lambda{ false })
    end
  end
end
