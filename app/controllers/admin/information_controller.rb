class Admin::InformationController < ApplicationController
  def index
    @information_title = Information.select(:title)
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
