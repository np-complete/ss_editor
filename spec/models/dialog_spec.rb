# -*- coding: utf-8 -*-
require 'spec_helper'

describe Dialog do
  describe "#valid?" do
    subject { FactoryGirl.build(:dialog) }
    it { should be_valid }
    its(:save) { should be_true }
  end

  describe "#set_default_line_num" do
    let(:line) { 10 }
    context "同じStoryがDialogを持っている" do
      let(:story) { FactoryGirl.create(:story, dialogs: 3) }
      it "一番大きいline_num + 1が line_num に設定される" do
        max_line_num = story.dialogs.map(&:line_num).max
        dialog = FactoryGirl.build(:dialog, story: story, line_num: line)
        lambda{
          dialog.send(:set_default_line_num)
        }.should change(dialog, :line_num).from(line).to(max_line_num + 1)
      end
    end


    context "同じStoryのDialogが存在しない場合" do
      let(:story) { FactoryGirl.create(:story) }
      it "line_num が1に設定される" do
        dialog = FactoryGirl.build(:dialog, story: story, line_num: line)
        lambda{
          dialog.send(:set_default_line_num)
        }.should change(dialog, :line_num).from(line).to(1)
      end
    end

    context "storyが指定されてない場合" do
      it "何もしない" do
        dialog = FactoryGirl.build(:dialog, story: nil, line_num: line)
        lambda{
          dialog.send(:set_default_line_num)
        }.should_not change(dialog, :line_num)
      end
    end
  end
end
