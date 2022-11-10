require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    User.create(name: 'Pepe Frog', email: 'test@example.com', password: 'password', password_confirmation: 'password')
  end
  before { @apple = Food.create(name: 'apple', measurement_unit: 'kg', price: 10, quantity: 10, user: subject) }

  context 'Validations should be working' do
    it 'ALL validations should return true' do
      expect(subject).to be_valid
    end

    it 'ALL validations should return true' do
      expect(@apple.name).to eql('apple')
    end

    it 'ALL validations should return true' do
      expect(@apple.price).to be_a_kind_of(Numeric)
    end

    it 'ALL validations should return true' do
      expect(@apple.quantity).to be(10)
    end

    it 'ALL validations should return true' do
      expect(@apple.measurement_unit).to eql('kg')
    end
  end
end
