class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    flash[:notice] = "#{@ingredient.name} successfully created"
    redirect_to @ingredient
  end

  def update
    @ingredient.update(ingredient_params)
    flash[:notice] = "Ingredient successfully updated"
    redirect_to @ingredient
  end

  def destroy
    flash[:notice] = "Ingredient successfully destroyed"
    @ingredient.destroy
    redirect_to @ingredient
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
