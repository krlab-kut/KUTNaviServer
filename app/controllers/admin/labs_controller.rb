class Admin::LabsController < ApplicationController
  def index
    @labs = Lab.all
    @places = Place.all
  end

  def create
    @lab = Lab.new(lab_params)
    if @lab.save
      redirect_to "/admin/#{:admin_id}/labs"
    else
      render 'new'
    end
  end

  def edit
    @lab = Lab.find(params[:id])
  end

  def update
    @lab = Lab.find(params[:id])

    if @lab.update(labs_params)
      redirect_to "/admin/#{:admin_id}/labs"
    else
      render 'edit'
    end
  end

  def destroy
    @lab = Lab.find(params[:id])
    @lab.destroy
    redirect_to "/admin/#{:admin_id}/labs"
  end

  def new
  end

  def show
  end


  private
    def lab_params
      params.require(:lab).permit(:name, :place_id)
    end
end
