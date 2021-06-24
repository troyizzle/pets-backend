require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'associations' do
    it { should have_one(:backstory).class_name('Pets::Backstory').dependent(:destroy) }
    it { should have_many(:images).class_name('Pets::Image').dependent(:destroy) }
  end

  describe 'validations' do
    subject { build(:pet) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
