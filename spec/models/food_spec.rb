require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:food) { FactoryBot.build(:food, user:) }

  it 'is valid with valid attributes' do
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food.name = nil
    expect(food).not_to be_valid
  end

  it 'is not valid without a price' do
    food.price = nil
    expect(food).not_to be_valid
  end

  it 'is not valid with a price less than or equal to 0' do
    food.price = 0
    expect(food).not_to be_valid
  end

  it 'is not valid without a measurement_unit' do
    food.measurement_unit = nil
    expect(food).not_to be_valid
  end

  it 'is not valid with a measurement_unit not included in [g, l, units]' do
    food.measurement_unit = 'kg'
    expect(food).not_to be_valid
  end

  it 'is not valid without a quantity' do
    food.quantity = nil
    expect(food).not_to be_valid
  end

  it 'is not valid with a quantity less than or equal to 0' do
    food.quantity = 0
    expect(food).not_to be_valid
  end
end
