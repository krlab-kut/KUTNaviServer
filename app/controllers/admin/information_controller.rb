class Admin::InformationController < ApplicationController
  def index
    @information = Information.all
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      @save_checker = true
    else
      @save_checker = false
    end
  end

  def show
    @information = Information.find(show_params[:id])
  end

  def edit
    @information = Information.find(edit_params[:id])
  end

  def update
    @information = Information.find(update_params[:id])

    if @information.update(information_params)
      @update_checker = true
    else
      @update_checker = false
    end
  end

  def destroy
    @information = Information.find(destroy_params[:id])

    if @information.destroy
      @destroy_checker = true
    else
      @destroy_checker = false
    end

    DeletedInformation.create(information_id: destroy_params[:id])
  end

  private
  def show_params
    params.permit(:id)
  end

  def edit_params
    params.permit(:id)
  end

  def update_params
    params.permit(:id)
  end

  def destroy_params
    params.permit(:id)
  end

  def information_params
    params.require(:information).permit(:title, :content)
  end

end
