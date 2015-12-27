require 'rails_helper'

RSpec.describe "numbers/new", type: :view do
  before(:each) do
    assign(:number, Number.new(
      :value => 1,
      :image_path => "MyText"
    ))
  end

  it "renders new number form" do
    render

    assert_select "form[action=?][method=?]", numbers_path, "post" do

      assert_select "input#number_value[name=?]", "number[value]"

      assert_select "textarea#number_image_path[name=?]", "number[image_path]"
    end
  end
end
