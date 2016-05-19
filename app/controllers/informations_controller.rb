class InformationsController < ApplicationController

def index
  skip_before_filter :verify_authenticity_token
  #timestampのデータを受け取り、それより大きい(新しい)データを格納
  @informations = Information.where("updated_at > ?",params[:latest_at] )
  #informtaionsに格納したデータをjsonとして出力
  render :json => @informations
end

end
