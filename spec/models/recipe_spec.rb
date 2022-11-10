require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    User.create(name: 'Pepe Frog', email: 'test@example.com', password: 'password', password_confirmation: 'password')
  end
  before do
    @recipe = Recipe.create(name: 'apple pie', preparation_time: 10, cooking_time: 10, description: 'Tasty!',
                            public: true, user: subject)
  end

  context 'Validations should be working' do
    it 'ALL validations should return true' do
      expect(subject).to be_valid
    end

    it 'ALL validations should return true' do
      expect(@recipe.name).to eql('apple pie')
    end

    it 'ALL validations should return true' do
      expect(@recipe.preparation_time).to be_a_kind_of(Numeric)
    end

    it 'ALL validations should return true' do
      expect(@recipe.cooking_time).to be(10)
    end

    it 'ALL validations should return true' do
      expect(@recipe.public).to be(true)
    end
  end
end
