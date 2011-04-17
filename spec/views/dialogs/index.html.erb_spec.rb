require 'spec_helper'

describe "dialogs/index.html.erb" do
  before(:each) do
    assign(:story, stub_model(Story))
    assign(:dialogs, [
      stub_model(Dialog),
      stub_model(Dialog)
    ])
  end

  it "renders a list of dialogs" do
    render
  end
end
