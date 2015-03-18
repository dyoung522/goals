FactoryGirl.define do
  factory :user do
    name     { Faker::Name.name }
    email    { Faker::Internet.safe_email }
    password { Faker::Internet.password(8) }

    address_book { create(:address_book) }

    trait :with_goals do
      goals { create_list(:goal, 5) }
    end
  end

  factory :address_book do
    name 'Test Address Book'
    contacts { create_list(:contact, 5) }
  end

  factory :contact do
    name  { Faker::Name.name }
    email { Faker::Internet.safe_email }
    active true
  end
end
