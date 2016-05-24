class InformationController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    #timestampのデータを受け取り、それより大きい(新しい)データを格納
    @information = Information.where("updated_at > ?",params[:latest_at] )
  end
end
