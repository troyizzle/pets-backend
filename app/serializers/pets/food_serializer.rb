class Pets::FoodSerializer
  include JSONAPI::Serializer
  extend ApplicationHelper

  attributes :rarity, :weight, :value, :hunger

  attribute :picture_url do |food|
    image_data(food.image)
  end
end
