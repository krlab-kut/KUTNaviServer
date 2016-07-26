class EventsController < ApplicationController
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
    #更新されたイベント情報を受け取る
    unless index_params[:latest_at] == nil
      @events = Event.where("updated_at > ?",index_params[:latest_at] )
    else
      @events = Event.All
    end
    #削除されたイベント情報を受け取る
    @deleted_events = DeletedEvent.where("updated_at > ?", index_params[:latest_at]).pluck(:id)
    #入力されたuser_idを受け取り格納する
    @user_id = {user_id: index_params[:user_id]}
    #サーバの現在時刻を受け取り格納する
    @nowServerTime = {timestamp: Time.now.strftime("%Y-%m-%d %H:%M:%S")}
  end

  private
  def index_params
    params.permit(:user_id, :latest_at)
  end
end
