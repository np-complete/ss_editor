require 'spec_helper'

describe "dialogs/index.html.erb" do
  before(:each) do
    assign(:story, stub_model(Story))
    assign(:dialogs, [
        stub_model(Dialog, :character => stub_model(Character), :face => stub_model(Face)),
        stub_model(Dialog, :character => stub_model(Character), :face => stub_model(Face))
    ])
  end

  it "renders a list of dialogs" do
    render
  end
end
