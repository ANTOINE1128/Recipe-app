# app/controllers/recipes_controller.rb

class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  
    def index
      @recipes = Recipe.all
    end
  
    def new
      @recipe = Recipe.new
    end
  
    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
          respond_to do |format|
            format.turbo_stream { render turbo_stream: turbo_stream.replace(@recipe) }
            format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
          end
        else
          render :new
        end
      end
      
  
    def show
    end
  
    def edit
    end
  
    def update
      if @recipe.update(recipe_params)
        redirect_to @recipe, notice: 'Recipe was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @recipe.destroy
      redirect_to recipes_url, notice: 'Recipe was successfully deleted.'
    end
  
    private
  
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
  
    def recipe_params
      params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
    end
end
  