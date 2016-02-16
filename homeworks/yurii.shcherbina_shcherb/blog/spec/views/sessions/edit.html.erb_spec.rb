require 'spec_helper'

describe "sessions/edit" do
  before(:each) do
    @session = assign(:session, stub_model(Session))
  end

  it "renders the edit session form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", session_path(@session), "post" do
    end
  end
end
