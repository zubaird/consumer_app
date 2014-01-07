require 'spec_helper'

describe "Employer Pages" do

	subject { page }
	let(:employer) { FactoryGirl.create(:employer_account) }

	before do 
		visit signin_path 
	    fill_in "Email",    with: employer.email.upcase
	    fill_in "Password", with: employer.password
	    click_button "Sign in"
	end

	xit { should have_link("Post a new job") }
	it { should have_link("Log out") }
	it { should have_link("Settings") }
    it { should have_content('My Profile') }
    it { should have_title("- #{employer.name}" ) }

    describe "settings page" do
    	before { visit edit_employer_path(employer) }

    	it { should have_title("Update Profile - #{employer.name}" ) }


    	describe "updating with valid information" do
			let(:new_name)  { "New Name" }
			let(:new_email) { "new@example.com" }

    		before do
	    		fill_in "Name", with: new_name
			    fill_in "Email",    with: new_email
			    fill_in "Password", with: employer.password
			    fill_in "Password", with: employer.password
			    click_button "Update"
		    end

		   	it { should have_title(new_name) }
			it { should have_link('Log out', href: signout_path) }

		end
    end
end