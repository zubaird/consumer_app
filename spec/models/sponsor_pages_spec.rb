require 'spec_helper'

describe "Sponsor Pages" do

	subject { page }
	let(:sponsor) { FactoryGirl.create(:sponsor_account) }

	before do 
		visit signin_path 
	    fill_in "Email",    with: sponsor.email.upcase
	    fill_in "Password", with: sponsor.password
	    click_button "Sign in"
	end

		describe "Signed in Sponsor home page" do

			it { should have_link("Add Candidate") }
			it { should have_link("Log out") }
		    it { should have_content('My Profile') }
		    it { should have_title('Home') }
		    it { should have_title("- #{sponsor.name}" ) }


		    describe "Signed in Sponsor show page" do

		    	before { visit sponsor_path(sponsor) }

		    	it { should have_title("Profile - #{sponsor.name}" ) }
				it { should have_link("Log out") }
		    
			end

		end






    describe "settings page" do
    	before { visit edit_sponsor_path(sponsor) }

    	it { should have_title("Update Profile - #{sponsor.name}" ) }


    	describe "updating with valid information" do
			let(:new_name)  { "New Name" }
			let(:new_email) { "new@example.com" }

    		before do
	    		fill_in "Name", with: new_name
			    fill_in "Email",    with: new_email
			    fill_in "Password", with: sponsor.password
			    fill_in "Password", with: sponsor.password
			    click_button "Update"
		    end

		   	it { should have_title(new_name) }
			it { should have_link('Log out', href: signout_path) }

		end

	end

end