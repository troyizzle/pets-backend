module Pets
  class Food < ApplicationRecord
    # TODO: Add validation..
    has_one_attached :image
  end
end
