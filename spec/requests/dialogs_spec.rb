require 'spec_helper'

describe "Dialogs" do
  describe "GET /dialogs" do
    before do
      @mock_auth = stub_model(User)
      @mock_story = stub_model(Story, :user_id => @mock_auth.id)
      User.stub(:find) { @mock_auth }
      Story.stub(:find) { @mock_story }
    end
    it "works! (now write some real specs)" do
      @mock_story.stub(:dialogs) { [stub_model(Dialog)] }
      #get story_dialogs_path(@mock_story)
      #response.status.should be(200)
    end
  end
end
