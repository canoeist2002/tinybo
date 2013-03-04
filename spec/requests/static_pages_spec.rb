require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content at the home page " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/static_pages/home'
      expect(response.body).to eq('Tinybo')
    end
  end
end
