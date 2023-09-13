# app/controllers/recipe_foods_controller.rb

class RecipeFoodsController < ApplicationController
    before_action :set_recipe
    before_action :set_recipe_food, only: [:edit, :update, :destroy]
  
    # New action to add a new food item to the recipe
    def new
      @recipe_food = RecipeFood.new
    end
  
    # Create action to save the new food item
    def create
      @recipe_food = RecipeFood.new(recipe_food_params)
      if @recipe_food.save
        redirect_to recipe_path(@recipe), notice: 'Food item was successfully added to the recipe.'
      else
        render :new
      end
    end
  
    # Edit action to modify the quantity and value of a food item
    def edit
    end
  
    # Update action to save the modified quantity and value
    def update
      if @recipe_food.update(recipe_food_params)
        redirect_to recipe_path(@recipe), notice: 'Food item was successfully updated.'
      else
        render :edit
      end
    end
  
    # Destroy action to remove a food item from the recipe
    def destroy
      @recipe_food.destroy
      redirect_to recipe_path(@recipe), notice: 'Food item was successfully removed from the recipe.'
    end
  
    private
  
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end
  
    def set_recipe_food
      @recipe_food = RecipeFood.find(params[:id])
    end
  
    def recipe_food_params
      params.require(:recipe_food).permit(:food_id, :quantity)
    end
  end
  