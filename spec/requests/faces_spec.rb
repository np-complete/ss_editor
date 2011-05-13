require 'spec_helper'

describe "Faces" do
  describe "GET /faces" do
    before do
      Character.stub(:find) { mock_character }
    end
    
    it "works! (now write some real specs)" do
      mock_character.stub(:faces) { [
          mock_face(:name => 'hoge', :url => 'unko')
        ] }
      get character_faces_path(mock_character)
      response.status.should be(200)
    end
  end
end
