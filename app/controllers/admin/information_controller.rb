class Admin::InformationController < ApplicationController
  def index
    @information = Information.all
  end

  def create
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

end
