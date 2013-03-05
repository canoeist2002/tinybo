# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "StaticPages" do
  subject { page }
  describe "Home page" do
    before { visit root_path }
    it { page.should have_content('Tinybo') }
    it { page.source.should have_selector('title', text: "Tinybo") }
  end

  describe "Help page" do
    it "should have the content " do
      visit help_path
      should have_content('帮助')
    end
  end
end
