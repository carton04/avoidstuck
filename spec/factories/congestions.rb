FactoryBot.define do
  factory :congestion do
    ski_resort_id { Faker::Number.between(from: 1, to: 15) }
    situation { Faker::Lorem.sentence }
    waiting { Faker::Number.between(from: 1, to: 999) }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    association :user 

    after(:build) do |congestion|
      congestion.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
