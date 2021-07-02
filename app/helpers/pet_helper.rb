# frozen_string_literal: true

module PetHelper
  def images_url(pet)
    return [] unless pet.images.attached?

    pet.images.map { |image| image_data(image) }
  end

  def image_url(pet)
    image_data(pet.image)
  end

  def image_data(img)
    return {} if img.blank?

    {
      name: img.blob.filename.to_s,
      path: Rails.application.routes.url_helpers.rails_blob_path(img, only_path: true)
    }
  end
end
