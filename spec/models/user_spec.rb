# -*- coding: utf-8 -*-
require 'spec_helper'

describe User do
  describe "#valid?" do
    subject { FactoryGirl.build(:user) }
    it { should be_valid }
    its(:save) { should be_true }
    it "openid_urlはunique" do
      User.create(subject.attributes)
      subject.should_not be_valid
    end
  end

  describe ".auth" do
    let(:user) { FactoryGirl.create(:user) }
    it "openid_urlを探す" do
      User.auth(user.openid_url).should == user
    end
  end
end
