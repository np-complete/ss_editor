# -*- coding: utf-8 -*-
require 'spec_helper'

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
  
  describe "#update_dialog_orders!" do
    fixtures :stories, :dialogs
    before do
      @story = stories(:yui_x_ui)
      @order = [dialogs(:yuiui_line_3).id, dialogs(:yuiui_line_1).id, dialogs(:yuiui_line_2).id]
    end
    
    it "daialogのすべてのidが引数に指定されていなかったら例外が出る" do
      lambda{
        @story.update_dialog_orders!([1,2])
      }.should raise_error(Story::DialogOrderError)
    end
    
    describe "与えられたidの順にline_numが1から順にふられる" do
      it "line_1 のline_numが2になる" do
        dialog = @story.dialogs[0]
        lambda{
          @story.update_dialog_orders!(@order)
        }.should change(dialog, :line_num).from(1).to(2)
      end
      it "line_2 のline_numが3になる" do
        dialog = @story.dialogs[1]
        lambda{
          @story.update_dialog_orders!(@order)
        }.should change(dialog, :line_num).from(2).to(3)
      end
      it "line_3 のline_numが1になる" do
        dialog = @story.dialogs[2]
        lambda{
          @story.update_dialog_orders!(@order)
        }.should change(dialog, :line_num).from(3).to(1)
      end
    end
  end
end
