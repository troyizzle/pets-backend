FactoryBot.define do
  factory :pets_background_answer, class: 'Pets::Background::Answer' do
    answer { Faker::Lorem.sentence(word_count: 5) }
    association :question
  end
end
