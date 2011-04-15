require 'spec_helper'

describe "faces/new.html.erb" do
  before(:each) do
    assign(:face, stub_model(Face).as_new_record)
  end

  it "renders new face form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => faces_path, :method => "post" do
    end
  end
end
