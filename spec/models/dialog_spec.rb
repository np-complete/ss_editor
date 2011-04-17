# -*- coding: utf-8 -*-
require 'spec_helper'

describe Dialog do
  fixtures :dialogs, :characters, :faces, :stories
  before do
    @valid_attributes = {
      :character => characters(:ritsu_tainaka),
      :face => faces(:ritsu_ahegao),
      :story => stories(:ritsu_x_mio),
      :line_num => 2,
      :message => 'ほげほげほげほげ'
    }
  end
  
  describe "#valid?" do
    subject { Dialog.new(@valid_attributes) }
    it { should be_valid }
    describe "[story, line_num]はunique" do
      subject { Dialog.new(@valid_attributes.merge(:line_num => 1)) }
      it { should_not be_valid }
      describe "story_idが違えば大丈夫" do
        subject { Dialog.new(@valid_attributes.merge(:line_num => 1, :story => stories(:yui_x_azu))) }
        it { should be_valid }
      end
    end
  end
  
  describe "#set_default_line_num" do
    it "同じStoryのDialogうち一番大きいline_num + 1が line_num に設定される" do
      dialog = Dialog.new(:story => stories(:ritsu_x_mio))
      dialog.send(:set_default_line_num)
      dialog.line_num.should be(2)
    end
    it "同じStoryのDialogが存在しない場合 line_num が1に設定される" do
      dialog = Dialog.new(:story => stories(:yui_x_azu))
      dialog.send(:set_default_line_num)
      dialog.line_num.should be(1)
    end
  end
end
