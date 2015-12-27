require "rails_helper"

RSpec.describe NumbersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/numbers").to route_to("numbers#index")
    end

    it "routes to #new" do
      expect(:get => "/numbers/new").to route_to("numbers#new")
    end

    it "routes to #show" do
      expect(:get => "/numbers/1").to route_to("numbers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/numbers/1/edit").to route_to("numbers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/numbers").to route_to("numbers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/numbers/1").to route_to("numbers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/numbers/1").to route_to("numbers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/numbers/1").to route_to("numbers#destroy", :id => "1")
    end

  end
end
