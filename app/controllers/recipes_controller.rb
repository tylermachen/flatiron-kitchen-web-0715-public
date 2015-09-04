class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients
  end

  def edit
  end

  def create
    @recipe = Recipe.create(recipe_params)
    flash[:notice] = "#{@recipe.name} successfully created"
    redirect_to @recipe
  end

  def update
    @recipe.update(recipe_params)
    flash[:notice] = "#{@recipe.name} successfully updated"
    redirect_to @recipe
  end

  def destroy
    flash[:notice] = "Recipe successfully destroyed"
    @recipe.destroy
    redirect_to @recipe
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end
end
