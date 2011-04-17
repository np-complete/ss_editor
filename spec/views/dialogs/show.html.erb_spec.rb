require 'spec_helper'

describe "dialogs/show.html.erb" do
  before(:each) do
    @dialog = assign(:dialog, stub_model(Dialog))
  end

  it "renders attributes in <p>" do
    render
  end
end
