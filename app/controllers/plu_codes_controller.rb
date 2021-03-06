class PluCodesController < ApplicationController

  def index
    @plu = PluCode.new 
    puts search_params
    @codes = PluCode.where(:number => search_params[:number])
  end 

  def new 
    @plu = PluCode.new
  end 

  def create
    PluCode.create(create_params)
    redirect_to :plu_codes
    flash[:success] = "Your product code has been submitted. Should be searchable in a few!"
  end 
  

  private

  def search_params
    params.permit(:number)
  end

  def create_params
    params.require(:plu_code).permit(:image)
  end

end
