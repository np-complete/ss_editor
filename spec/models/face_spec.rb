# -*- coding: utf-8 -*-
require 'spec_helper'

describe Face do
  fixtures :faces, :characters, :users
  before do
    @valid_attributes = {
      :name => 'アヘ顔',
      :character => characters(:mio_akiyama),
      :user => users(:nakano_azusa)
    }
  end

  describe '#valid?' do
    subject { Face.new(@valid_attributes) }
    it { should be_valid }
    its(:save) { should be_true }
    it "name は必須" do
      subject.name = nil
      subject.should_not be_valid
    end
    it "characeter_id は必須" do
      subject.character_id = nil
      subject.should_not be_valid
    end
    it "user_id は必須" do
      subject.user_id = nil
      subject.should_not be_valid
    end
  end

  describe "#url" do
    it "icon.url(:thumb)が呼ばれる" do
      face = faces(:ritsu_ahegao)
      face.stub_chain(:icon, :url).with(:thumb) { 'unko' }
      face.url.should eq('unko')
    end
  end
end
