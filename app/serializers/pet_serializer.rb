
class PetSerializer
  include JSONAPI::Serializer
  extend PetHelper

  has_one :backstory, serializer: Pets::BackstorySerializer
  has_many :images, serializer: Pets::ImageSerializer

  attributes :name
  # TODO: This should just be handled by in the included data
  attributes :backstory do |pet|
    pet.backstory.body
  end

  attribute :images_url do |pet|
    pet.images.default.map { |img| image_data(img.picture) }
  end
end
