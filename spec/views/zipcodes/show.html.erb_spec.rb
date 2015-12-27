require 'rails_helper'

RSpec.describe "zipcodes/show", type: :view do
  before(:each) do
    @zipcode = assign(:zipcode, Zipcode.create!(
      :value => 1,
      :image_path => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
