require 'rails_helper'

RSpec.describe "numbers/show", type: :view do
  before(:each) do
    @number = assign(:number, Number.create!(
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
