require 'spec_helper'

describe "Account Pages" do

	subject { page }

	describe "profile page" do
	    let(:valid_account) { FactoryGirl.create(:employer_account) }
	    let(:valid_sponsor_account) { FactoryGirl.create(:sponsor_account) }
	    before { visit account_path(valid_account) }

	    it { should have_content(valid_account.name) }
	    it { should have_title(valid_account.name) }
  	end
  	describe "sign up " do
		before { visit new_account_path }

		it { should have_content("Consumer App")}
		let(:submit) { "Create my account"} # => He re we’ve factored out the common text for the submit button using the let method to define a submit variable.

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit}.not_to change(Account, :count)
			end
		end

		describe "with valid information as type: Employer" do
			before do 
				fill_in "Name", with: "Example Account"
				fill_in "Email", with: "account2@example.com"
				fill_in "Type", with: "Employer"
				fill_in "Password", with: "foobar"
				fill_in "Confirm Password", with: "foobar"
			end

			it "should create a account" do
				expect { click_button submit }.to change(Account, :count).by(1)
				
			end
			describe "after saving the user" do
		        before { click_button submit }
		        let(:found_account) { Account.find_by(email: 'account2@example.com') }

		        it { should have_link('Log out') }
		        it { should have_title(found_account.name) }
		        it { should have_selector('div.alert.alert-success', text: 'Welcome!') }
		    end
		end

		describe "with valid information as type: Sponsor" do
			before do 
				fill_in "Name", with: "Example Account"
				fill_in "Email", with: "account2@example.com"
				fill_in "Type", with: "Sponsor"
				fill_in "Password", with: "foobar"
				fill_in "Confirm Password", with: "foobar"
			end

			it "should create a account" do
				expect { click_button submit }.to change(Account, :count).by(1)
				
			end
			describe "after saving the user" do
		        before { click_button submit }
		        let(:found_account) { Account.find_by(email: 'account2@example.com') }

		        it { should have_link('Log out') }
		        it { should have_title(found_account.name) }
		        it { should have_selector('div.alert.alert-success', text: 'Welcome!') }
		    end
		end
	end
end