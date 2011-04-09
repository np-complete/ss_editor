# -*- coding: utf-8 -*-
require 'spec_helper'

describe Character do
  before do
    @valid_attributes = {
      :name => 'hoge'
    }
  end
  
  describe "#valid?" do
    subject { Character.new(@valid_attributes) }
    it { should be_valid }
    describe "nameは必須" do
      subject { Character.new }
      it { should_not be_valid }
    end
    describe "nameはユニーク" do
      fixtures :characters
      subject { Character.new(:name => 'hage') }
      it { should_not be_valid }
    end
  end
end
