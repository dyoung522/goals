FactoryGirl.define do
  factory :contact do
    name Faker::Name.name
    email Faker::Internet.safe_email
    active true
  end
end
