require 'spec_helper'

describe Sponsor do

before { @sponsor = Account.create(name: "Example Sponsor", email: "sponsor@example.com", password: "foobart", password_confirmation: "foobart", type: "Sponsor" )}

subject { @sponsor }

#Inherited Attributes
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }  
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }
	it { should respond_to(:remember_token) }
	it { should respond_to(:type)}

#Relational Attributes
	it { should have_many(:candidates) }
	it { should_not have_many(:job_postings) }













	

	# it { should respond_to(:relationships) }  
	# it { should respond_to(:followed_users) }


	# it { should respond_to(:reverse_relationships) } #CHAPTER 11 
	# it { should respond_to(:followers) } #CHAPTER 11

	# it { should respond_to(:following?) } #CHAPTER 11
	# it { should respond_to(:follow!) } #CHAPTER 11
	# it { should respond_to(:unfollow!) } #CHAPTER 11

 # describe "following" do
 #    before { @followed = Account.new(name: "Example User", email: "user3@example.com", password: "foobar", password_confirmation: "foobar", type: "Sponsor" )}
 #  	#before { @follower = Account.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar", type: "Sponsor" )}
 #    before do
 #      @sponsor.save
 #      @followed.save
 #      @sponsor.follow!(@followed)
 #    end

 #    it { should be_following(@followed) }
 #    its(:followed_users) { should include(@followed) }


 #    describe "and unfollowing" do
 #      before { @sponsor.unfollow!(@followed) }

 #      it { should_not be_following(@followed) }
 #      its(:followed_users) { should_not include(@followed) }
 #    end
 #  end

	



end