FactoryBot.define do
  factory :order_ship do
    post_code        { '123-4567' }
    area_id          { Faker::Number.between(from: 2, to: 48) }
    city             { '東京都' }
    address          { '1-1' }
    building         { '東京ハイツ' }
    phone            { '09000000000' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
