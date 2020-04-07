FactoryBot.define do
  factory :event do
    user
    title { Faker::App.name }
    notes { Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote }
    date { Faker::Date.in_date_period(year: 2018, month: rand(1..12)) }
    time { "14:00:00" }
    mileage { Faker::Number.decimal(l_digits: 2) }
    income { Faker::Number.decimal(l_digits: 3) }
  end
end


