require 'spec_helper'

describe "dialogs/new.html.erb" do
  before(:each) do
    assign(:dialog, stub_model(Dialog).as_new_record)
  end

  it "renders new dialog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dialogs_path, :method => "post" do
    end
  end
end
