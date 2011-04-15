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
    describe "nameは必須" do
      subject { Character.new }
      it { should_not be_valid }
    end
    describe "nameはユニーク" do
      subject { Character.new(:name => '秋山澪') }
      it { should_not be_valid }
    end
  end
end
