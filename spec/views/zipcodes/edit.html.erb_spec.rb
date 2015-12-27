require 'rails_helper'

RSpec.describe "zipcodes/edit", type: :view do
  before(:each) do
    @zipcode = assign(:zipcode, Zipcode.create!(
      :value => 1,
      :image_path => "MyText"
    ))
  end

  it "renders the edit zipcode form" do
    render

    assert_select "form[action=?][method=?]", zipcode_path(@zipcode), "post" do

      assert_select "input#zipcode_value[name=?]", "zipcode[value]"

      assert_select "textarea#zipcode_image_path[name=?]", "zipcode[image_path]"
    end
  end
end
