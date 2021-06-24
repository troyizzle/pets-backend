module Pets
  class BackstorySerializer
    include JSONAPI::Serializer
    attributes :body, :pet_id
  end
end
