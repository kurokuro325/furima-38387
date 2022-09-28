FactoryBot.define do
  factory :item do
    item          { 'abcd123' }
    explanation   { 'Faker::Lorem.sentence' }
    detail_category_id { 2 }
    detail_condition_id { 2 }
    delivery_burden_id { 2 }
    prefecture_id { 2 }
    delivery_day_id { 2 }
    price { '3000' }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/design.jpg'), filename: 'design.jpg')
    end
  end
end
