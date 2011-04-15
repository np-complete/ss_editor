require 'spec_helper'

describe "faces/edit.html.erb" do
  before(:each) do
    @face = assign(:face, stub_model(Face))
  end

  it "renders the edit face form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => faces_path(@face), :method => "post" do
    end
  end
end
