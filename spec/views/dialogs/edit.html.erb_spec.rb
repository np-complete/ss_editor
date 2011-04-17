require 'spec_helper'

describe "dialogs/edit.html.erb" do
  before(:each) do
    @story  = assign(:story, stub_model(Story))
    @dialog = assign(:dialog, stub_model(Dialog))
  end

  it "renders the edit dialog form" do
    render

    assert_select "form", :action => story_dialogs_path(@story, @dialog), :method => "post" do
    end
  end
end
