FactoryBot.define do
  factory :user do
    name { Faker::GreekPhilosophers.name }
    email { Faker::Internet.email }
  end
end