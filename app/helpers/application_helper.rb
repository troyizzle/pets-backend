# frozen_string_literal: true

module ApplicationHelper
  def image_data(img)
    return {} if img.blank?

    {
      name: img.blob.filename.to_s,
      path: Rails.application.routes.url_helpers.rails_blob_path(img, only_path: true)
    }
  end
end
