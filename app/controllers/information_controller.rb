class InformationController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    #そもそもuser_idとlatest_atが無い、受け取れていない場合の判定
    unless index_params.has_key?(:user_id) && index_params.has_key?(:latest_at)
      @information = {status: "400 Bad_Request"}
      return
    end
    #受け取ったuser_idがデータベースに存在しない場合の判定
    unless User.exists?(id: index_params[:user_id])
      @information = {status: "404 Not_found"}
      return
    end
    #timestamp形式のデータを受け取り、それより大きい(新しい)最新情報を格納
    @information = Information.where("updated_at > ?",index_params[:latest_at] )
    @time = {timestamp: index_params[:latest_at]}
  end

  private
  def index_params
    params.permit(:user_id, :latest_at)
  end
end
