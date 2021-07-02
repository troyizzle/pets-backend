class BattleChannel < ApplicationCable::Channel
  def subscribed
    set_battle
    stream_for @battle
  end

  def receive(data)
    set_battle
    pet = ::User::Pet.find(data['attackee_id'].to_i)
    # TODO: Move this to an before_create on action??
    pet.update(health: pet.health - data['damage'])
    attack = @battle.actions.create(
      attacker_id: data['attacker_id'],
      attackee_id: data['attackee_id'],
      damage: data['damage'],
      weapon: data['weapon_id']
    )

    BattleChannel.broadcast_to(@battle, { action: 'Update Pet',
                                          combat: ::User::Pet::Battle::ActionSerializer.new(attack).serializable_hash,
                                          data: ::User::PetSerializer.new(pet).serializable_hash })
  end

  private

  def set_battle
    @battle = ::User::Pet::Battle.find(params[:battle_id])
  end
end
