require 'rails_helper'

RSpec.describe "numbers/index", type: :view do
  before(:each) do
    assign(:numbers, [
      Number.create!(
        :value => 1,
        :image_path => "MyText"
      ),
      Number.create!(
        :value => 1,
        :image_path => "MyText"
      )
    ])
  end

  it "renders a list of numbers" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
