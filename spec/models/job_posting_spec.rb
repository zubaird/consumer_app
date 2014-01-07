require 'spec_helper'

describe JobPosting do

	before { @employer = Account.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar", type: "Employer" )}
	#let(:employer) { FactoryGirl.create(:account) }

	before do
	 @jobposting = @employer.job_postings.new(	title: "Sample Job Post",
	 											description: "This is an awesome job yo and i am strugglng to make more than 140 chars, twiterrrrrr why did u start this trend????????????????????????????????????????????????????????????????ahhhhhhhhhhhhahahahahahhahxhhzhzhzhzhzhhzhzhzhzkhckjsahfjsadhjhdsjaghajsdhdsh;g",
	 											city: "Manteca",
	 											state: "CA",
	 											tag: "cool")
	end
	subject { @jobposting }
 
	it { should respond_to :title }
	it { should respond_to :description }
	it { should respond_to :city }
	it { should respond_to :state }
	it { should respond_to :tag }
	it { should respond_to :employer_id}
	it { should respond_to :id}




	#its(@jobposting.employer) { should eq @employer }
	

	it {should be_valid }

	describe "accessible attributes" do
		it { should_not allow_mass_assignment_of(:employer_id) } 
	end

	describe "accessible attributes" do
		it { should_not allow_mass_assignment_of(:id) } 
	end

	describe "The state field," do
		describe "with invalid entries" do
		it { should_not allow_value('.;', "11", "0", "state", " ").for(:state) }
		it { should ensure_length_of(:state).is_at_most(2) }
		end

		describe "with valid entries" do
		it { should allow_value("CA", "ca").for(:state) }
		end
	end

	describe "The city field," do
		describe "with invalid entries" do
		it { should_not allow_value('k6', "b.a0w", "Los_gatos", " ", " ").for(:city) }
		end

		describe "with valid entries" do
		it { should allow_value("CA", "Manteca", "Los Angelos").for(:city) }
		end
	end		

	describe "The title field," do
		describe "with invalid entries" do
		it { should_not allow_value(" ").for(:title) }
		it { should ensure_length_of(:title).is_at_most(140) }
		it { should ensure_length_of(:title).is_at_least(15) }
		end

		describe "with valid entries" do
		it { should allow_value("SUPER GREAT JOB TITLE", "This should also be /more than 15 char", "Los Angelos. California!").for(:title) }
		end
	end

	describe "The description field," do
		describe "with invalid entries" do
		it { should_not allow_value(" ").for(:description) }
		it { should ensure_length_of(:description).is_at_least(140) }
		end
	end

	describe "The tag field," do
		describe "with funky entries" do
		it { should_not allow_value("/.>$*0()+").for(:tag) }
		end
	end




end
