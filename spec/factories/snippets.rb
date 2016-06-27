FactoryGirl.define do
  factory :snippet do
    title { Faker::Internet.domain_word }
    work { Faker::Internet.password }
  end
end
