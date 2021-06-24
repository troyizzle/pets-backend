FactoryBot.define do
  factory :user_notification, class: 'User::Notification' do
    message { Faker::Name.name }
    association :user
  end
end
