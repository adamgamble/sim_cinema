require 'factory_girl'

FactoryGirl.define do
  factory :movie do
    name Faker::Company.bs
  end

  factory :movie_studio do
    name Faker::Company.name
  end

  factory :proposal do
    movie
    movie_studio
  end

  factory :actor do
    name Faker::Name.name
  end
end
