require 'spec_helper'

describe Sponsor do

before { @sponsor = Account.new(name: "Example Sponsor", email: "sponsor@example.com", password: "foobart", password_confirmation: "foobart", type: "Sponsor" )}

subject { @sponsor }

#Inherited Attributes
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }  
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }
	it { should respond_to(:remember_token) }
	it {should respond_to(:type)}

#Relational Attributes
	it { should have_many(:candidates) }
	it { should_not have_many(:job_postings) }

	





end