class Account < ActiveRecord::Base

  before_save { self.email = email.downcase }
	#before_save { self.type = type.downcase }
	before_create :create_remember_token

  acts_as_followable
  acts_as_follower

	attr_accessible :name, :email, :password, :password_confirmation, :type
	has_secure_password

	validates :name, presence: true, length: { maximum: 50 }	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :type, :inclusion  => { :in => %w(Sponsor Employer Consumer), :message => "%{value} is not a valid role, you need to type in either 'Sponsor' or 'Employer', it is case-sensitive.  This step will also help us ensure that you are human." }




    def Account.new_remember_token
      SecureRandom.urlsafe_base64
    end

    def Account.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end


   private
     def create_remember_token
       self.remember_token = Account.encrypt(Account.new_remember_token) #create a new rem.token and then encrypt it
     end   
end
