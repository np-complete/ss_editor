require 'spec_helper'

describe "stories/index.html.haml" do
  let(:stories) { FactoryGirl.create_list(:story, 2) }
  before do
    assign(:stories, stories)
  end

  it "renders a list of stories" do
    render
  end
end
