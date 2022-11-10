class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
    @total_value = 0
    @total_ingredients = 0
    @missing_foods = []
    @recipe_foods.each do |ingredient|
      next if (ingredient.quantity) <= (Food.find(ingredient.food_id).quantity)

      @total_value += (ingredient.quantity - Food.find(ingredient.food_id).quantity) * ingredient.food.price
      @total_ingredients += 1
      @missing_foods << ingredient
    end
  end
end
