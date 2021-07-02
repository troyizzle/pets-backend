require 'rails_helper'

RSpec.describe User::Pet::Battle::Action, type: :model do
  describe 'associations' do
    it { should belong_to(:battle).class_name('::User::Pet::Battle') }
  end
end
