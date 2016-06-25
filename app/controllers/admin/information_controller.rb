class Admin::InformationController < ApplicationController
  def index
    @information = Information.all
  end

  def create
    @information = Information.new(create_params)
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
  end

  def show
    @information = Information.find(show_params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def show_params
    params.permit(:id)
  end
  def create_params
    params.require(:information).permit(:title, :content)
  end

end
