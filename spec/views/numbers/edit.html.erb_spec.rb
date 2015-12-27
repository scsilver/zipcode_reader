require 'rails_helper'

RSpec.describe "numbers/edit", type: :view do
  before(:each) do
    @number = assign(:number, Number.create!(
      :value => 1,
      :image_path => "MyText"
    ))
  end

  it "renders the edit number form" do
    render

    assert_select "form[action=?][method=?]", number_path(@number), "post" do

      assert_select "input#number_value[name=?]", "number[value]"

      assert_select "textarea#number_image_path[name=?]", "number[image_path]"
    end
  end
end
