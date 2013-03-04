# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content at the home page " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      page.should have_content('Tinybo')
    end

    it "should have title 'Tinybo' "do
      visit '/static_pages/home'
      page.source.should have_selector('title', text: "Tinybo")
    end
  end

  describe "Help page" do
    it "should have the content " do
      visit '/static_pages/help'
      page.should have_content('帮助')
    end
  end
end
