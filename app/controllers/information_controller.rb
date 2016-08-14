class InformationController < ApplicationController
  def index
    #リクエストに必要なパラメータが含まれているか確認
    unless index_params.has_key?(:user_id) && index_params.has_key?(:latest_at)
      @res = {status: "400 Bad_Request"}
      return
    end

    #リクエストのパラメータで指定されたレコードが存在するか確認
    unless User.exists?(id: index_params[:user_id])
      @res = {status: "404 Not_found"}
      return
    end

    unless index_params[:latest_at] == nil
      @information = Information.where("updated_at > ?",index_params[:latest_at] )
    else
      @information = Information.All
    end
    @deleted_information = DeletedInformation.where("updated_at > ?", index_params[:latest_at]).pluck(:information_id)
    @nowServerTime = {timestamp: Time.now.strftime("%Y-%m-%d %H:%M:%S")}
  end

  private
  def index_params
    params.permit(:user_id, :latest_at)
  end
end
