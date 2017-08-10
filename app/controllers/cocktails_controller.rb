class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [ :show, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktails)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  protected

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def params_cocktails
    params.require(:cocktail).permit(:name)
  end
end
