require 'spec_helper'

describe "Dialogs" do
  describe "GET /dialogs" do
    before do
      Story.stub(:find) { mock_story }
    end
    it "works! (now write some real specs)" do
      mock_story.stub(:dialogs) { [mock_dialog] }
      get story_dialogs_path(mock_story)
      response.status.should be(200)
    end
  end
end
