class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(name: ct_params[:name])
    @cocktail.save

    redirect_to cocktail_path(@cocktail)
  end

  private

  def ct_params
    params.require(:cocktail).permit(:name)
  end
end