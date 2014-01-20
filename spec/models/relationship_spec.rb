require 'spec_helper'

describe Relationship do
  

# before { @follower = Account.create(name: "Example Follower", email: "follower@example.com", password: "foobart", password_confirmation: "foobart", type: "Sponsor" )}
# before { @followed = Account.create(name: "Example Followed", email: "followed@example.com", password: "foobart", password_confirmation: "foobart", type: "Sponsor" )}


	let(:follower) { FactoryGirl.create(:sponsor_account) }
  	let(:followed) { FactoryGirl.create(:sponsor_account) }
	let(:relationship) { follower.relationships.build(followed_id: followed.id)}


	# let(:relationship) { follower.relationships.build(followed_id: followed.id)}


 	subject { relationship }

 	it { should be_valid }

	describe "accessible attributes" do
		it { should_not allow_mass_assignment_of(:followed_id) } 
	end

	describe "follower methods" do

		it { should respond_to(follower.id)}
		it { should respond_to(followed.id)}
		its(:follower_id) { should == follower.id}
		its(:followed_id) { should == followed.id}
	end





	describe "when follower is not present" do  #User model-level test
		before { relationship.follower_id = nil }
		it { should_not be_valid }
	end

	describe "when followed is not present" do #User model-level test
		before { relationship.followed_id = nil }
		it { should_not be_valid }
	end

end
