require 'rails_helper'

RSpec.describe User::Pet::Battle, type: :model do
  describe 'associations' do
    it { should belong_to(:winner).class_name('::User').optional(:true) }
    it { should have_many(:actions).class_name('::User::Pet::Battle::Action').dependent(:destroy) }
  end
end
