class Admin::PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to "/admin/#{:admin_id}/places"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @place = Place.find(edit_params[:id])
  end

  def update
    @place = Place.find(update_params[:id])

    if @place.update(place_params)
      redirect_to "/admin/#{:admin_id}/places"
    else
      render 'edit'
    end
  end

  def destroy
    @place = Place.find(destroy_params[:id])
    @place.destroy
    redirect_to "/admin/#{:admin_id}/places"
  end

  private
  def edit_params
    params.permit(:id)
  end

  def update_params
    params.permit(:id)
  end

  def destroy_params
    params.permit(:id)
  end

  def place_params
    params.require(:place).permit(:name, :counter)
  end
end
