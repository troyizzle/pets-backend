class User::Pet::BattleSerializer
  include JSONAPI::Serializer

  has_one :challenger, serializer: User::PetSerializer
  has_one :opponent, serializer: User::PetSerializer

  attributes :winner, :challenger_id, :opponent_id
end
