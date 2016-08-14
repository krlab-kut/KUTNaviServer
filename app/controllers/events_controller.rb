class EventsController < ApplicationController
  def index
    #リクエストに必要なパラメータが含まれているか確認
    unless index_params.has_key?(:user_id) && index_params.has_key?(:latest_at)
      @res = {status: "400 Bad_Request"}
      return
    end

    #リクエストのパラメータで指定されたレコードが存在するか確認
    unless User.exists?(id: index_params[:user_id])
      @res = {status: "400 Bad_Request"}
      return
    end

    unless index_params[:latest_at] == nil
      @events = Event.where("updated_at > ?",index_params[:latest_at] )
    else
      @events = Event.All
    end
    @deleted_events = DeletedEvent.where("updated_at > ?", index_params[:latest_at]).pluck(:event_id)
    @nowServerTime = {timestamp: Time.now.strftime("%Y-%m-%d %H:%M:%S")}
  end

  private
  def index_params
    params.permit(:user_id, :latest_at)
  end
end
