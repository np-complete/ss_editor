# -*- coding: utf-8 -*-
require 'spec_helper'

describe Face do
  fixtures :faces, :characters
  before do
    @valid_attributes = {
      :name => 'アヘ顔',
      :character => characters(:mio_akiyama)
    }
  end
  
  describe '#valid?' do
    subject { Face.new(@valid_attributes) }
    it { should be_valid }
    describe "name は必須" do
      subject { Face.new(:character => characters(:mio_akiyama)) }
      it { should_not be_valid }
    end
    describe "characeter_id は必須" do
      subject { Face.new(:name => 'アヘ顔') }
      it { should_not be_valid }
    end
  end
end
