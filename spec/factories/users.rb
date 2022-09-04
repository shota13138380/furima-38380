FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"陸太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"リクタロウ"}
    birthday              {Faker::Date.birthday(min_age: 5, max_age: 92)}
  end
end