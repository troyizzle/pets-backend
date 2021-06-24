module Pets
  class Backstory < ApplicationRecord
    belongs_to :pet
  end
end
