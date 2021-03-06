require 'spec_helper'

describe Relationship do
  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  it { should be_valid }

  it "should not allow to access follwer id" do
    expect do
      Relationship.new(follower_id: follower.id)
    end.to raise_error(ActiveModel::MassAssignmentSecurity::Error) 
  end

  describe "follower method" do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    its(:follower) { should == follower }
    its(:followed) { should == followed }
  end
end
