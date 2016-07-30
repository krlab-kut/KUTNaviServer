class Admin::FavoritesController < ApplicationController
  def index
    @labs = Place.all
  end

  def show
    @favorites = Favorite.all
    @labs = Place.all
    @rank = {}
    @labs.each do |lab|
      count = 0
      @favorites.each do |favorite|
        count += 1 if (lab.id - 16) == favorite.lab_id
      end
      @rank[lab.name] = count
    end
    @rank = @rank.sort_by{|lab, val| -val}.to_h
  end
end
