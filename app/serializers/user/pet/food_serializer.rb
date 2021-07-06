class User::Pet::FoodSerializer
  include JSONAPI::Serializer
  extend ApplicationHelper

  has_one :food, serializer: Pets::FoodSerializer

  attributes :rarity, :weight, :value, :hunger, :last_decay_at

  attribute :picture_url do |food|
    image_data(food.food.image)
  end
end
