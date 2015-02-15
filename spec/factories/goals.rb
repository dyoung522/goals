FactoryGirl.define do
  factory :goal do
    topic 'test topic'
    user  { create :user, email: 'bogus@example.org' }
  end
end
