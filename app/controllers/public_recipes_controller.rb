class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true).order('id DESC')
  end
end
