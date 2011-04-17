require 'spec_helper'

describe "Dialogs" do
  describe "GET /dialogs" do
    before do
      @mock_story = Story.stub(:find) { stub_model(Story) }
    end
    it "works! (now write some real specs)" do
      @mock_story.stub(:dialogs) { [stub_model(Dialog)] }
      get story_dialogs_path(@mock_story)
      response.status.should be(200)
    end
  end
end
