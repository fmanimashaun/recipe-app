require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).not_to be_valid
  end

  describe '#recipes' do
    it 'can have many recipes' do
      user.save
      FactoryBot.create(:recipe, user:)
      FactoryBot.create(:recipe, user:)

      expect(user.recipes.length).to eq 2
    end
  end
end
