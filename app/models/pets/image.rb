module Pets
  class Image < ApplicationRecord
    has_one_attached :picture

    belongs_to :pet, class_name: 'Pet'
    enum trait: {
      default: 0,
      hungry: 1
    }

    def blob_path
      return unless picture.attached?

      ActiveStorage::Blob.service.send(:path_for, picture.key)
    end
  end
end
