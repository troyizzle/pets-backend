class User::Pet::Battle::ActionSerializer
  include JSONAPI::Serializer

  attribute :combat_message do |action|
    action.combat_message
  end
end
