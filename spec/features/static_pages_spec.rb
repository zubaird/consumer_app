require 'spec_helper'

describe "Static Pages -" do

	before { visit root_path }
	subject { page }

	it { should have_content("Consumer App")}
	it { should have_title("Consumer App | Home")}
	it { should have_link('Sign me up!', signup_path)}



	describe "when on the home page," do 
		describe "and when signed in Employer home page" do

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
		    it { should have_title("Home - #{employer.name}" ) }

		    describe "settings page" do
		    	describe "updating" do
		    		#it { should ensure_length_of(:password).is_at_least(6) }
		    	end
		    end
		end
	end
end
