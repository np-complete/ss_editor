# -*- coding: utf-8 -*-
require 'spec_helper'

describe Character do
  describe :attributes do
    subject { FactoryGirl.build(:character) }
    it { should be_valid }
    its(:save) { should be_true }

    describe :name do
      context :nil do
        before { subject.name = nil }
        it { should_not be_valid }
      end
      context :not_unique do
        before { Character.create(subject.attributes) }
        it { should_not be_valid }
      end
    end
  end
end
