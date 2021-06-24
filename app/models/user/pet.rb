require 'open-uri'

class User::Pet < ApplicationRecord
  belongs_to :user
  belongs_to :pet, class_name: '::Pet'
  has_many :backgrounds, class_name: 'User::Pet::Background', dependent: :destroy
  accepts_nested_attributes_for :backgrounds, allow_destroy: true
  GENDERS = %w(M F).freeze

  # TODO: Change Pets::Image to have a polymorphic relationship??
  has_one_attached :image

  validates :name, presence: true
  validates :gender, inclusion: { in: GENDERS }

  after_create :default_stats

  def hungry?
    hunger < Pet::HUNGRY
  end

  def update_pic
    return unless hungry?

    pic = pet&.images&.hungry&.first

    return unless pic.picture.attached?

    image.attach(
      io: File.open(pic.blob_path),
      filename: 'hungry_corgi'
    )
  end

  def attach_remote_uri(uri)
    return if uri.blank?

    image.attach(io: URI.open(uri), filename: uri)
  end

  private 

  def default_stats
    self.health = self.health.zero? ? rand(Pet::MIN_HEALTH..Pet::MAX_HEALTH) : self.health
    self.attack = self.attack.zero? ? rand(Pet::MIN_ATTACK..Pet::MAX_ATTACK) : self.attack
    self.hunger = self.hunger.zero? ? rand(Pet::MIN_HUNGER..Pet::MAX_HUNGER) : self.hunger
    save
  end
end
