class FavoritesController < ApplicationController
  def create
    #リクエストに必要なパラメータが含まれているか確認
    unless create_params.has_key?(:user_id) && create_params.has_key?(:place_id)
      @res = {status: "400 Bad_Request"}
      return
    end

    #リクエストのパラメータで指定されたレコードが存在するか確認
    unless User.exists?(id: index_params[:user_id])
      @res = {status: "400 Bad_Request"}
      return
    end
    unless Place.exists?(id: index_params[:place_id])
      @res = {status: "404 Not_found"}
      return
    end

    if Favorite.where("user_id = ? && lab_id = ?" ,create_params[:user_id], create_params[:place_id]).exists?
      @res = {status: "200 OK"}
      return
    end

    @favorite = Favorite.new
    @favorite.user_id = create_params[:user_id]
    @favorite.lab_id = create_params[:place_id]

    if @favorite.save
      @res = { status: "200 OK" }
    else
      @res = { status: "500 ServerError"}
    end
  end

  def delete
    #リクエストに必要なパラメータが含まれているか確認
    unless delete_params.has_key?(:user_id) && delete_params.has_key?(:place_id)
      @res = {status: "400 Bad_Request"}
      return
    end

    #リクエストのパラメータで指定されたレコードが存在するか確認
    unless User.exists?(id: index_params[:user_id])
      @res = {status: "400 Bad_Request"}
      return
    end
    unless Place.exists?(id: index_params[:place_id])
      @res = {status: "404 Not_found"}
      return
    end

    if Favorite.where("user_id = ? && lab_id = ?", delete_params[:user_id], delete_params[:place_id]).destroy_all
      @res = {status: "200 OK"}
    else
      @res = {status: "400 Bad_Request"}
    end
  end

  private
  def create_params
    params.permit(:user_id, :place_id)
  end

  def delete_params
    params.permit(:user_id, :place_id)
  end
end
