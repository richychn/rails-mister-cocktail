class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [ :show, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(params_cocktails)
  end

  protected

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def params_cocktails
    params.require(:cocktail).permit(:name)
  end
end
