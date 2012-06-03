require 'spec_helper'

describe "faces/index.html.haml" do

  before(:each) do
    assign(:faces, [
      stub_model(Face),
      stub_model(Face)
    ])
    @character = assign(:character, stub_model(Character))
    end

  it "renders a list of faces" do
    render
  end
end
