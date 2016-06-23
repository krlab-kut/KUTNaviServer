class FavoritesController < ApplicationController
  def create
    unless create_params.has_key?(:user_id) && create_params.has_key?(:place_id)
      @res = {status: "400 Bad_Request"}
      return
    end

    if Favorite.exists?(user_id: create_params[:user_id])
      @favorite = Favorite.new
      @favorite.user_id = create_params[:user_id]
    else
      @favorite = Favoite.where("user_id = ?", create_params[:user_id])
    end

    @favorite.place_id = create_params[:place_id]

    if create_params[:user_id] == nil
      if @user.save
        @res = { status: "200 OK" }
      else
        @res = { status: "500 ServerError"}
      end
    else
      if @user.update
        @res = { status: "200 OK" }
      else
        @res = { status: "500 ServerError"}
      end
    end
  end

  private
  def create_params
    params.permit(:user_id, :place_id)
  end
end
