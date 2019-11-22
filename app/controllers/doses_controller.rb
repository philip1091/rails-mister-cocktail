class DosesController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :set_dose only: [:new, :create, :destroy]
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy


    # @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses(params[:cocktail_id])
    @dose.destroy
    # flash[:success] = "deleted"
    redirect_to  cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end


