class Admin::FavoritesController < ApplicationController
  def index
    @labs = Lab.all
  end
end
