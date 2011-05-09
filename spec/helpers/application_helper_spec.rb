# -*- coding: utf-8 -*-
require 'spec_helper'

include ApplicationHelper
describe ApplicationHelper do
  describe "#login?" do
    it "controller.login? を呼ぶ" do
      controller.should_receive(:login?) { true }
      login?.should be_true
    end
  end
end
