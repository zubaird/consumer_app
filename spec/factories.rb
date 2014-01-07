FactoryGirl.define do
  factory :account do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end


  factory :sponsor_account, :parent => :account do
    type  "Sponsor"
  end

  factory :employer_account, :parent => :account do
    type  "Employer"
  end

  factory :job_posting do
    title "a"*35
    description "a"*50
    city "foobar"
    state "CA"
    tag "foobar"

  end


end