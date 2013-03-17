require 'spec_helper'

describe User do

  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should respond_to(:followed_users) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }

  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:followers) }

  it { should be_true }


  describe 'username format' do
    before { @user.name = "" }
    its(:valid?) { should be_false }
  end

  describe 'username is to short the 3 letter' do
    before { @user.name = "aa"}
    its(:valid?) { should be_false }
  end

  describe "micropost in the correct order" do
    let(:user)  { FactoryGirl.create(:user) }

    let!(:older_micropost) do
      FactoryGirl.create(:micropost, user: user, created_at: 1.day.ago)
    end

    let!(:newer_micropost) do
      FactoryGirl.create(:micropost, user: user, created_at: 1.hour.ago)
    end

    it "should have the right microposts in the right order" do
      user.microposts.should == [newer_micropost, older_micropost]
    end
  end
  
end
