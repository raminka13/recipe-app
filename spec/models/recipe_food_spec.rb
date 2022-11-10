require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    User.create(name: 'Pepe Frog', email: 'test@example.com', password: 'password', password_confirmation: 'password')
  end
  before { @apple = Food.create(name: 'apple', measurement_unit: 'kg', price: 10, quantity: 10, user: subject) }
  before do
    @recipe = Recipe.create(name: 'apple pie', preparation_time: 10, cooking_time: 10, description: 'Tasty!',
                            public: true, user: subject)
  end
  before { @recipe_food = RecipeFood.create(quantity: 5, recipe: @recipe, food: @apple) }

  context 'Validations should be working' do
    it 'ALL validations should return true' do
      expect(subject).to be_valid
    end

    it 'ALL validations should return true' do
      expect(@recipe_food.quantity).to be(5)
    end

    it 'RecipeFood food\'s name should return \'apple\'' do
      expect(@recipe_food.food.name).to eql('apple')
    end

    it 'RecipeFood recipe\'s name should return \'apple pie\'' do
      expect(@recipe_food.recipe.name).to eql('apple pie')
    end
  end
end
