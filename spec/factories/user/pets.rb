FactoryBot.define do
  factory :user_pet, class: 'User::Pet' do
    name { Faker::Name.name }
    gender { ::User::Pet::GENDERS.sample }
    association :pet
    association :user
  end
end
