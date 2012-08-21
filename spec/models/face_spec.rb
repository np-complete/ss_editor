# -*- coding: utf-8 -*-
require 'spec_helper'

describe Face do
  describe '#valid?' do
    subject { FactoryGirl.build(:face) }
    it { should be_valid }
    its(:save) { should be_true }
    describe :name do
      context :nil do
        before { subject.name = nil }
        it { should_not be_valid }
      end
    end

    describe :character do
      context :nil do
        before { subject.character = nil }
        it { should_not be_valid }
      end
    end

    describe :user do
      context :nil do
        before { subject.user = nil }
        it { should_not be_valid }
      end
    end
  end

  describe "#url" do
    let(:face) { FactoryGirl.create(:face) }
    it "icon.url(:thumb)が呼ばれる" do
      face.stub_chain(:icon, :url).with(:thumb) { 'unko' }
      face.url.should == 'unko'
    end
  end
end
