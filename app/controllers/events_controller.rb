class EventsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    #timestamp形式のデータを受け取り、それより大きい(新しい)最新情報を格納
    @events = Event.where("updated_at > ?",params[:latest_at] )
  end

  private
  def index_params
    params.require(:events).permit(:user_id, :latest_at)
  end
end
