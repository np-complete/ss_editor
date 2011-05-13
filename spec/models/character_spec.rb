# -*- coding: utf-8 -*-
require 'spec_helper'

describe Character do
  fixtures :characters
  before do
    @valid_attributes = {
      :name => '平沢唯'
    }
  end
  
  describe "#valid?" do
    subject { Character.new(@valid_attributes) }
    it { should be_valid }
    its(:save) { should be_true }
    it "nameは必須" do
      subject.name = nil
      subject.should_not be_valid
    end
    it "nameはユニーク" do
      subject.name = '秋山澪'
      subject.should_not be_valid
    end
  end
end
