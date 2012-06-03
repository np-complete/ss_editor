require 'spec_helper'

describe "faces/edit.html.haml" do
  before(:each) do
    @face = assign(:face, stub_model(Face))
    @character = assign(:character, stub_model(Character))
  end

  it "renders the edit face form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => character_faces_path(@character, @face), :method => "post" do
    end
  end
end
