# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "authorization" do

    describe "for non-signed-in users" do

      describe "submitting to the create action" do
        before { post microposts_path }
        specify { response.should redirect_to(root_path) }
      end
    end
  end
 
end