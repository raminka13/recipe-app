class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.all.includes([:user]).where(public: true).order('id DESC')
  end
end
