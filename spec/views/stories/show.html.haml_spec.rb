require 'spec_helper'

describe "stories/show.html.haml" do
  before(:each) do
    @story = assign(:story, stub_model(Story, :user => stub_model(User)))
    @auth = assign(:auth, stub_model(User))
  end

  it "renders attributes in <p>" do
    render
  end
end
