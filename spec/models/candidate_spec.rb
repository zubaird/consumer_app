require 'spec_helper'

describe Candidate do

	before { @sponsor = Account.new(name: "Example Sponsor", email: "super_sponsor@example.com", password: "foobar", password_confirmation: "foobar", type: "Sponsor" )}
	#let(:employer) { FactoryGirl.create(:account) }

	before do
	 @candidate = @sponsor.candidates.new(	name: "Sample Job Post",
	 										bio: "This is an awesome job yo and i am strugglng to make more than 140 chars, twiterrrrrr why did u start this trend????????????????????????????????????????????????????????????????ahhhhhhhhhhhhahahahahahhahxhhzhzhzhzhzhhzhzhzhzkhckjsahfjsadhjhdsjaghajsdhdsh;g",
	 										city: "Manteca",
	 										state: "CA",
	 										has_transport: true,
	 										additional_skills: "cool")

	end
	
	subject { @candidate }
 
	it { should respond_to :name }
	it { should respond_to :bio }
	it { should respond_to :city }
	it { should respond_to :state }
	it { should respond_to :additional_skills }
	it { should respond_to :has_transport }
	it { should respond_to :sponsor_id}
	it { should respond_to :id}

	it { should be_valid }



	describe "accessible attributes" do
		it { should_not allow_mass_assignment_of(:sponsor_id) } 
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

	describe "The name field," do
		describe "with invalid entries" do
		it { should_not allow_value(" ").for(:name) }
		it { should ensure_length_of(:name).is_at_most(255) }
		it { should ensure_length_of(:name).is_at_least(1) }
		end
	end

	describe "The bio field," do
		describe "with invalid entries" do
		it { should_not allow_value(" ").for(:bio) }
		it { should ensure_length_of(:bio).is_at_least(140) }
		end
	end

	describe "The name field," do
		describe "with funky entries" do
		it { should_not allow_value("/.>$*0()+").for(:name) }
		end
	end

	describe "The has transport field," do
		
		it { should_not allow_value(" ").for(:has_transport) }
	end

	# describe "when sponsor_id is not present" do
	# 	before { @candidate.sponsor_id = nil }
	# 	it { should_not be_valid }
	# end 


end