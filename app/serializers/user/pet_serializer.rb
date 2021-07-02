class User::PetSerializer
  include JSONAPI::Serializer
  extend PetHelper

  attributes :name, :health, :attack, :hunger

  attribute :user_id do |pet|
    pet.user.id
  end

  attribute :image_url do |pet|
    image_url(pet)
  end
end
