require 'spec_helper'

describe "dialogs/show.html.erb" do
  before(:each) do
    @story  = assign(:story, stub_model(Story))
    @dialog = assign(:dialog, stub_model(Dialog))
  end

  it "renders attributes in <p>" do
    render
  end
end
