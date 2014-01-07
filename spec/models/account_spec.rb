require 'spec_helper'

describe Account do

  before { @account = Account.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar", type: "Sponsor" )}

  subject { @account }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }   #actual db column
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should respond_to(:remember_token) }

  it {should respond_to(:type)}

  it { should be_valid }

  it { should ensure_inclusion_of(:type).in_array(%w(Sponsor Employer)) }
  it { should ensure_length_of(:password).is_at_least(6) }


  	describe "when name is not present" do
	    before { @account.name = " " }
	    it { should_not be_valid }
  	end

  	describe "when name is too long" do
	    before { @account.name = "a" * 51 }
	    it { should_not be_valid }
  	end

   	describe "when email is not present" do
	   before { @account.email = " "}
	   it  {should_not be_valid}
  	end

  	describe "when email format is invalid" do
	    it "should be invalid" do
	      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
	      addresses.each do |invalid_address|
	        @account.email = invalid_address
	        expect(@account).not_to be_valid
	      end
    	end
  	end

  	describe "when email format is valid" do
	    it "should be valid" do
	      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	      addresses.each do |valid_address|
	        @account.email = valid_address
	        expect(@account).to be_valid
	      end
    	end
    end

    describe "when password is not present" do
		before do
		    @account = Account.new(name: "Example Account", email: "sposnor@example.com", password: " ", password_confirmation: " ")
		end
  		it { should_not be_valid }
	end



	describe "type field values," do
		describe "when type not present" do
			before do
			    @account = Account.new(name: "Example Account", email: "sposnor@example.com", password: "foobart", password_confirmation: "foobart", type: " ")
			end
			it { should_not be_valid }
		end

		describe "when type not sponsor or employee" do 
			it { should_not allow_value('Sponsors', 'Wrongtype').for(:type) }
		end

		describe "when type is employer" do 
			before do
			    @account = Account.new(name: "Example Account", email: "sposnor@example.com", password: "foobart", password_confirmation: "foobart", type: "Employer")
			end
			it { should be_valid }
		end

		describe "when type is sponsor" do 
			before do
			    @account = Account.new(name: "Example Account", email: "sposnor@example.com", password: "foobart", password_confirmation: "foobart", type: "Sponsor")
			end
			it { should be_valid }
		end
	end



	describe "when password doesn't match confirmation" do
	  	before { @account.password_confirmation = "mismatch" }
	  	it { should_not be_valid }
	end

	describe "return value of authenticate method" do #To test after it is saved, what happens?
	  before { @account.save } #saves to DB for authenticate method to work
	  let(:found_account) { Account.find_by(email: @account.email) }  #digs into database

		describe "with valid password" do
		    it { should eq found_account.authenticate(@account.password) }
		end

		describe "with invalid password" do
		    let(:account_for_invalid_password) { found_account.authenticate("invalid") }

		    it { should_not eq account_for_invalid_password }

		    specify { expect(account_for_invalid_password).to be_false }
		end
	end

	describe "remember token" do  #check the Account model and make sure this happens
		before { @account.save }
		its(:remember_token) { should_not be_blank }
	end

end













