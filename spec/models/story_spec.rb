# -*- coding: utf-8 -*-
require 'spec_helper'

describe Story do
  describe "#valid?" do
    subject { FactoryGirl.build(:story) }
    it { should be_valid }
    its(:save) { should be_true }

    describe :title do
      context :nil do
        before { subject.title = nil }
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

  describe "#update_dialog_orders!" do
    let(:story) { FactoryGirl.create(:story, dialogs: 3) }
    let(:order) { [story.dialogs[2].id, story.dialogs[0].id, story.dialogs[1].id] }

    it "daialogのすべてのidが引数に指定されていなかったら例外が出る" do
      dialog_ids = story.dialogs[0, 1].map(&:id)
      lambda{
        story.update_dialog_orders!(dialog_ids)
      }.should raise_error(Story::DialogOrderError)
    end

    it "与えられたidの順にline_numが1から順にふられる" do
      story.update_dialog_orders!(order)
      story.dialogs.map(&:line_num) == [2, 3, 1]
    end
  end
end
