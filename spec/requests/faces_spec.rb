require 'spec_helper'

describe "Faces" do
  describe "GET /faces" do
    let!(:character) { FactoryGirl.create(:character) }
    before { Character.stub(:find).and_return(character) }

    it "works! (now write some real specs)" do
      pending "unko test"
      get character_faces_path(character)
      response.status.should be(200)
    end
  end
end
