require 'spec_helper'

describe User do
  before { @user = FactoryGirl.create(:user) }

  subject { @user }

  it { should respond_to(:microposts) }

  let!(:older_micropost) do
    FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
  end

  let!(:newer_micropost) do
    FactoryGirl.create(:micropost, user: @user, created_at: 1.hour.ago)
  end

  it "should have the right microposts in the right order" do
    @user.microposts.should == [newer_micropost, older_micropost]
  end
  
end
