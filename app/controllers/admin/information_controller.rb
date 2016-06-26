class Admin::InformationController < ApplicationController
  def index
    @information = Information.all
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      @save_checker = true
    else
      @save_checker = false
    end
  end

  def new
    @information = Information.new
  end

  def edit
    @information = Information.find(id_params[:id])
  end

  def show
    @information = Information.find(id_params[:id])
  end

  def update
    @information = Information.find(id_params[:id])
    if @information.update(information_params)
      @update_checker = true
    else
      @update_checker = false
    end
  end

  def destroy
    @information = Information.find(id_params[:id])
    if @information.destroy
      @destroy_checker = true
    else
      @destroy_checker = false
    end
  end

  private
  def id_params
    params.permit(:id)
  end
  def information_params
    params.require(:information).permit(:title, :content)
  end

end
