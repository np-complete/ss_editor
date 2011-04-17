require 'spec_helper'

describe "dialogs/new.html.erb" do
  before(:each) do
    @story = assign(:story, stub_model(Story))
    assign(:dialog, stub_model(Dialog).as_new_record)
  end

  it "renders new dialog form" do
    render
    assert_select "form", :action => story_dialogs_path(@story), :method => "post" do
    end
  end
end
