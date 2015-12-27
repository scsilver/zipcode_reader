require 'rails_helper'

RSpec.describe "Numbers", type: :request do
  describe "GET /numbers" do
    it "works! (now write some real specs)" do
      get numbers_path
      expect(response).to have_http_status(200)
    end
  end
end
