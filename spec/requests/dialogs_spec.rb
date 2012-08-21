require 'spec_helper'

describe "Dialogs" do
  describe "GET /dialogs" do
    let(:user) { FactoryGirl.create(:user) }
    let(:story) { FactoryGirl.create(:story, user: user) }
    before do
      User.stub(:find).and_return(user)
      Story.stub(:find).and_return(story)
    end
    it "works! (now write some real specs)" do
      #get story_dialogs_path(story)
      #response.status.should be(200)
    end
  end
end
