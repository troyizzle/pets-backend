class User::PetSerializer
  include JSONAPI::Serializer
  extend PetHelper

  attributes :name, :health, :attack, :hunger

  attribute :image_url do |pet|
    image_url(pet)
  end
end
