class Admin::PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def create
    @place = Place.new(places_params)
    if @place.save
      redirect_to "/admin/#{:admin_id}/places"
    else
      render 'new'
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])

    if @place.update(places_params)
      redirect_to "/admin/#{:admin_id}/places"
    else
      render 'edit'
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to "/admin/#{:admin_id}/places"
  end

  def new
  end

  def show
  end


  private
    def places_params
      params.require(:place).permit(:name, :counter)
    end
end
