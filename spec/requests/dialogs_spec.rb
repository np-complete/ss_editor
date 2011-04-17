require 'spec_helper'

describe "Dialogs" do
  describe "GET /dialogs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get dialogs_path
      response.status.should be(200)
    end
  end
end
