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
    its(:save) { should be_true }
  end
  
  describe "#set_default_line_num" do
    it "同じStoryのDialogうち一番大きいline_num + 1が line_num に設定される" do
      dialog = Dialog.new(:story => stories(:ritsu_x_mio), :line_num => 10)
      lambda{
        dialog.send(:set_default_line_num)
      }.should change(dialog, :line_num).from(10).to(2)
    end
    
    it "同じStoryのDialogが存在しない場合 line_num が1に設定される" do
      dialog = Dialog.new(:story => stories(:yui_x_azu), :line_num => 10)
      lambda{
        dialog.send(:set_default_line_num)
      }.should change(dialog, :line_num).from(10).to(1)
    end
    
    it "story_idが指定されてない場合は何もしない" do
      dialog = Dialog.new
      lambda{
        dialog.send(:set_default_line_num)
      }.should_not change(dialog, :line_num)
    end
  end
end
