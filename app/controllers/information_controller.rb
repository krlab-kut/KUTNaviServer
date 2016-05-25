class InformationController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    #timestamp形式のデータを受け取り、それより大きい(新しい)最新情報を格納
    @information = Information.where("updated_at > ?",params[:latest_at] )
  end

  private
  def question_params
    params.require(:information).permit(:uuid, :latest_at)
  end
end
