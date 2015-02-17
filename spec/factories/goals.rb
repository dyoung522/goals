FactoryGirl.define do
  factory :goal do
    topic    { Faker::Hacker.say_something_smart }
    category { create :category }

    trait :with_update do
      update
    end
  end

  factory :update do
    text { Faker::Hacker.ingverb }
  end

  factory :category do
    name { Faker::Commerce.department(1, true) }
  end

end
