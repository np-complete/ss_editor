# -*- coding: utf-8 -*-
require 'spec_helper'

describe Story do
  describe Story do
    before do
      @valid_attributes = {
        :title => 'ほげ'
      }
    end
    
    describe "#valid?" do
      subject { Story.new(@valid_attributes) }
      it { should be_valid }
      its(:save) { should be_true }
      describe "titleは必須" do
        subject { Story.new }
        it { should_not be_valid }
      end
    end
  end
end
