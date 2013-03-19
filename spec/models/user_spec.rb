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

  describe 'username is too short the 3 letter' do
    before { @user.name = "aa"}
    its(:valid?) { should be_false }
  end

  describe 'username is too long the 26 letter' do
    before { @user.name = "a" * 27 }
    its(:valid?) { should be_false }
  end

  describe 'user email is not present' do
    before { @user.email = "" }
    its(:valid?) { should be_false }
  end

  describe 'user email is not be valid' do
    before { @user.email = "aa.aa"}
    its(:valid?) { should be_false }
  end

  describe 'user password is too short the 6 letter' do
    before { @user.password = "12345" }
    its(:valid?) { should be_false }
  end

  describe 'usre password_confirmation is not match' do
    before { @user.password_confirmation = "mismatch" }
    its(:valid?) { should be_false }
  end

  describe 'user password_confirmation is nil' do
    before  { @user.password_confirmation = nil }
    its(:valid?) { should be_false }
  end

  describe 'user password and password_confirmation is not present' do
    before { @user.password = @user.password_confirmation = " " }
    its(:valid?) { should be_false }
  end

  describe 'when email address is already token ' do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
      its(:valid?){ should be_false }
  end

  describe 'when email address is mixed case' do
    before do
      user_with_same_email = @user.dup
      @user.email = "test@example.com"
      user_with_same_email.email = "TesT@example.com"
      user_with_same_email.save
    end
      its(:valid?){ should be_false }
  end

  describe 'user has the right slug' do
    before do
      @user.name = "example"
      @user.save
    end
    its(:slug){ should == @user.name }
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

  describe "micropost association" do
    let(:other_user) { FactoryGirl.create(:user) }
    let(:other_user_post) { FactoryGirl.create(:micropost, user: other_user) }
    let(:post){ FactoryGirl.create(:micropost, user: @user) }

    before do
      @user.save
    end

     its(:feed) { should include(post) }
     its(:feed) { should_not include(other_user_post) }

       describe "following" do
        before { @user.follow!(other_user) }

        it { should be_following(other_user) }
        its(:followed_users) { should include(other_user) }

        describe "unfollowing" do
        before { @user.unfollow!(other_user) }

        it { should_not be_following(other_user) }
        its(:followed_users) { should_not include(other_user) }
       end
     end
  end
end
