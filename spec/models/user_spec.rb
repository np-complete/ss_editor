# -*- coding: utf-8 -*-
require 'spec_helper'

describe User do
  fixtures :users
  before do
    @valid_attributes = {
      :name => 'ほげ',
      :openid_url => 'test@test'
    }
  end
  
  describe "#valid?" do
    subject { User.new(@valid_attributes) }
    it { should be_valid }
    it "openid_urlはunique" do
      subject.openid_url = 'takuan@yuri.net'
      subject.should_not be_valid
    end
  end
  
  describe ".auth" do
    it "openid_urlを探す" do
      User.auth('nakano_azusa@example.com').should eq(users(:nakano_azusa))
    end
  end
end
