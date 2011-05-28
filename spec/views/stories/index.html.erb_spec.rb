require 'spec_helper'

describe "stories/index.html.erb" do
  before(:each) do
    assign(:stories, [
      stub_model(Story, :user => mock_user(:name => 'aaa')),
      stub_model(Story, :user => mock_user(:name => 'bbb'))
    ])
  end

  it "renders a list of stories" do
    render
  end
end
