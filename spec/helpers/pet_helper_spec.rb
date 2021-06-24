require 'rails_helper'

describe PetHelper  do
  describe 'image_url' do
    subject { helper.image_url(pet) }

    context 'when pet has no images attached' do
      let(:pet) { create(:pet) }

      it { is_expected.to eq([]) }
    end

    context 'when pet has images attached' do
      let(:pet) { create(:pet, :with_images) }

      it 'returns an array of hashes with name and path' do
        expect(subject.first).to have_key(:name)
        expect(subject.first).to have_key(:path)
      end
    end
  end
end
