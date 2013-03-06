# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "signin page" do
    before { visit new_user_session_path }

    it { source.should have_selector('h2', text: '登陆') }
    it { source.should have_selector('title', text: '登陆') }
  end
  
end