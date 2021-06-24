require 'rails_helper'

RSpec.describe User::Pet, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:pet).class_name('::Pet') }
    it { should have_many(:backgrounds).class_name('User::Pet::Background').dependent(:destroy) }

    context 'user association' do
      subject { create(:user_pet).user }

      it { expect(subject).to be_an_instance_of(User) }
    end
  end

  describe 'validiations' do
    it { should validate_presence_of(:name) }
    it { should validate_inclusion_of(:gender).in_array(User::Pet::GENDERS) }
  end

  describe 'hungry?' do
    subject { build(:user_pet, hunger: hunger).hungry? }

    context 'when hunger is higher than Pet::HUNGRY' do
      let(:hunger) { Pet::HUNGRY + 1 }

      it { is_expected.to be_falsey }
    end

    context 'when hunger is lower than Pet::HUNGRY' do
      let(:hunger) { Pet::HUNGRY - 1 }

      it { is_expected.to be_truthy }
    end
  end

  describe '#create' do
    context 'default_stats' do
      subject { create(:user_pet) }

      it { expect(subject.health).to be_between(Pet::MIN_HEALTH, Pet::MAX_HEALTH) }
      it { expect(subject.attack).to be_between(Pet::MIN_ATTACK, Pet::MAX_ATTACK) }
      it { expect(subject.hunger).to be_between(Pet::MIN_HUNGER, Pet::MAX_HUNGER) }
    end
  end
end
