class Admin::LabsController < ApplicationController
  def index
    @labs = Lab.all
    @places = Place.all
  end

  def new
    @lab = Lab.new
  end

  def create
    @lab = Lab.new(lab_params)
    if @lab.save
      redirect_to "/admin/#{:admin_id}/labs"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @lab = Lab.find(edit_params[:id])
  end

  def update
    @lab = Lab.find(update_params[:id])

    if @lab.update(labs_params)
      redirect_to "/admin/#{:admin_id}/labs"
    else
      render 'edit'
    end
  end

  def destroy
    @lab = Lab.find(destroy_params[:id])
    @lab.destroy
    redirect_to "/admin/#{:admin_id}/labs"
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

  def lab_params
    params.require(:lab).permit(:name, :place_id)
  end
end
