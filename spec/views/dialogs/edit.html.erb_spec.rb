require 'spec_helper'

describe "dialogs/edit.html.erb" do
  before(:each) do
    @dialog = assign(:dialog, stub_model(Dialog))
  end

  it "renders the edit dialog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dialogs_path(@dialog), :method => "post" do
    end
  end
end
