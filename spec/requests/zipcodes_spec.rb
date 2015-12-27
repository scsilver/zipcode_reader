require 'rails_helper'

RSpec.describe "Zipcodes", type: :request do
  describe "GET /zipcodes" do
    it "works! (now write some real specs)" do
      get zipcodes_path
      expect(response).to have_http_status(200)
    end
  end
end
