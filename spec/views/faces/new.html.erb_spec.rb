require 'spec_helper'

describe "faces/new.html.erb" do
  before(:each) do
    assign(:face, stub_model(Face).as_new_record)
    @character = assign(:character, stub_model(Character))
  end

  it "renders new face form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => character_faces_path(@character), :method => "post" do
    end
  end
end
