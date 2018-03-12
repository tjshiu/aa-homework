class BandsController < ApplicationController
  def index
    @bands = Bands.all
    render :index
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      flash[:success] = "Successfully Created the Band"
      redirect_to band_url(@band)
    else
      flash.now[:errors] = "Incomplete Band Creation"
      render :new
    end
  end

  def new
    render :new
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def update
  end

  def destroy
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
