require 'spec_helper'

describe "faces/show.html.erb" do
  before(:each) do
    @face = assign(:face, stub_model(Face))
    @character = assign(:character, stub_model(Character))
  end

  it "renders attributes in <p>" do
    render
  end
end
