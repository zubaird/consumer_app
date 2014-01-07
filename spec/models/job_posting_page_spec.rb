require 'spec_helper'

describe "Job posting pages" do


	subject { page }

	let(:employer) { FactoryGirl.create(:employer_account) }

	before do
		visit signin_path
		fill_in "Email",    with: employer.email.upcase
		fill_in "Password", with: employer.password
		click_button "Sign in"
	end

# => Here we want to 1. sign in a user, 2. Click on Post...
# => 3. If there's not valid information, 4. It should not...
# => Change the #of Microposts in the Database, and should...
# => 5. Have an error.  

#partial: 

	describe "job post creation" do
		before { visit new_job_posting_path(@employer) }
		#let(:job_post) { FactoryGirl.create(:job_posting) }

		describe "with invalid information" do
			#invalid information
			before do 
				fill_in "Title",    with: "a"
				fill_in "Description", with: "invalid"
				fill_in "City", with: "Manteca"
				fill_in "State", with: "CAL"
				fill_in "Tag", with: "bla//"
			end

			it "should not create a job posting" do
				expect { click_button "Post"}.not_to change(JobPosting, :count)
			end

			describe "error messages" do
				before { click_button "Post"}
				it { should have_content("error")} 
			end
		end
	end

	# describe "Job post destruction" do 
	# 	before { FactoryGirl.create(:employer_account) }

	# 	describe "as correct user" do
	# 		before { visit root_path}

	# 		it "should delete a job posting" do 
	# 			expect { click_link "delete"}.should change(JobPosting, :count).by(-1)
	# 		end
	# 	end
	# end
end