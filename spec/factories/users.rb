FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }

    transient do
      person { Gimei.name }
    end
    first_name { person.first.kanji }
    last_name { person.last.kanji }
    kana_first_name { person.first.katakana }
    kana_last_name { person.last.katakana }
    birth_date { Faker::Date.backward }
  end
end
