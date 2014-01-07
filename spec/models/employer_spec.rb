require 'spec_helper'

describe Employer do

before { @employer = Account.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar", type: "Employer" )}

subject { @employer }

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
	it { should have_many(:job_postings) }
	it { should_not have_many(:candidates) }
	#it { should have_db_index(:id) }



end