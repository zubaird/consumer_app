 require 'spec_helper'

describe "Account Authentication Pages" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }

  end
  

  describe "signin" do
	    before { visit signin_path }

	    describe "with invalid information" do
	      before { click_button "Sign in" }

	      it { should have_title('Sign in') }
	      it { should have_selector('div.alert.alert-error') }
		    describe "after visiting another page" do
		        before { click_link "Consumer App" }
		        it { should_not have_selector('div.alert.alert-error') }
	      	end
	    end

	    describe "with valid information as employer" do
	      let(:employer) { FactoryGirl.create(:employer_account) }
	      before do
	        fill_in "Email",    with: employer.email.upcase
	        fill_in "Password", with: employer.password
	        click_button "Sign in"
	      end

	      it { should have_title(employer.name) }
	      it { should have_link('My Profile',     href: employer_path(employer)) }
	      it { should have_link('Log out',    href: signout_path) }
	      

	      describe "when current employer is the same as shown employer" do
	      	before { visit account_path(employer) }
	      	it { should have_link("Messages") }


	      	#it { should have_link("Messages") }
	      end

	      describe "when current user is the NOT same as shown user" do

		      let(:different_employer) { FactoryGirl.create(:employer_account) }
		      before do
		      	visit signin_path
		        fill_in "Email",    with: different_employer.email.upcase
		        fill_in "Password", with: different_employer.password
		        click_button "Sign in"
		        visit account_path(employer)
		      end
		      	
		      	it { should_not have_link("Messages") }
	      	end
	    end


	    describe "with valid information as Sponsor" do
	      let(:sponsor) { FactoryGirl.create(:sponsor_account) }
	      before do
	        fill_in "Email",    with: sponsor.email.upcase
	        fill_in "Password", with: sponsor.password
	        click_button "Sign in"
	      end

	      it { should have_title(sponsor.name) }
	      it { should have_link('My Profile',     href: sponsor_path(sponsor)) }
	      it { should have_link('Log out',    href: signout_path) }
	      

	      describe "when current sponsor is the same as shown sponsor" do
	      	before { visit account_path(sponsor) }
	      	it { should have_link("Messages") }
	      	#it { should have_link("Messages") }
	      end

	      describe "when current user is the NOT same as shown user" do

		      let(:different_sponsor) { FactoryGirl.create(:sponsor_account) }
		      before do
		      	visit signin_path
		        fill_in "Email",    with: different_sponsor.email.upcase
		        fill_in "Password", with: different_sponsor.password
		        click_button "Sign in"
		        visit account_path(sponsor)
		      end
		      	
		      	it { should_not have_link("Messages") }
	      	end
	    end




  end


	describe "authorization" do

		describe "for non-signed-in employer" do

		    let(:user) { FactoryGirl.create(:employer_account) }

		    describe "in the Account controller" do

		        describe "visiting the edit account page" do
		          before { visit edit_account_path(user) }
		          it { should have_title('Sign in') }
		        end

		        describe "submitting to the update action" do
		          before { patch account_path(user) }
		          specify { expect(response).to redirect_to(signin_path) }
		        end

				describe "visiting the account index" do
				before { visit accounts_path }
				it { should have_title('Sign in') }
				end
		    end
		end
	end
end












