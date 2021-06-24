FactoryBot.define do
  factory :pet do
    name { Faker::Name.name }

    trait :with_images do
      file_path = Rails.root.join("tmp", "corgi.png")
      images { Rack::Test::UploadedFile.new(file_path, 'image/png') }

      after :create do |pet|
        pet.images.attach(
          io: File.open(file_path),
          filename: 'corgi'
        )
      end
    end
  end
end
