class InformationController < ApplicationController
  def index
    #そもそもuser_idとlatest_atが無い、受け取れていない場合の判定
    unless index_params.has_key?(:user_id) && index_params.has_key?(:latest_at)
      @res = {status: "400 Bad_Request"}
      return
    end
    #受け取ったuser_idに対応するidを持つUserが存在しない場合の判定
    unless User.exists?(id: index_params[:user_id])
      @res = {status: "404 Not_found"}
      return
    end
    #更新された最新情報を格納する
    unless index_params[:latest_at] == nil
      @information = Information.where("updated_at > ?",index_params[:latest_at] )
    else
      @information = Information.All
    end
    #削除された最新情報を受け取る
    @deleted_information = DeletedInformation.where("updated_at > ?", index_params[:latest_at]).pluck(:information_id)
    #サーバの現在時刻を受け取り格納する
    @nowServerTime = {timestamp: Time.now.strftime("%Y-%m-%d %H:%M:%S")}
  end

  private
  def index_params
    params.permit(:user_id, :latest_at)
  end
end
