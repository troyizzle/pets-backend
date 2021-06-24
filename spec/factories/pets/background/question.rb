FactoryBot.define do
  factory :pets_background_question, class: 'Pets::Background::Question' do
    question { Faker::Lorem.sentence }
  end
end
