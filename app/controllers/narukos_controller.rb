class NarukosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
=begin
    user_id = check_uuid(:params[:uuid])
    @user = User.find(user_id)
=end
    @user = User.find(index_params[:uuid])
    @res = {"response": "false"}
    @narukos = Naruko.where("created_at > ?", Time.now - 60)
    @narukos.each do |naruko|
      if naruko[:place_id] == index_params[:place_id].to_i() then
        @res[:response] = "true"
        break
      end
    end
  end

  def create
=begin
    user_id = check_uuid(:params[:uuid])
    @user = User.find(user_id)
=end
    # naruko情報の登録
    @user = User.find(create_params[:uuid])
    if @naruko = Naruko.create(place_id: create_params[:place_id])
      @res = { status: "200 OK" }
    else
      @res = {status: "400 Bad_Request"}
    end
  end

  private
  def index_params
    params.permit(:uuid, :place_id)
  end

  def create_params
    params.permit(:uuid, :place_id)
  end
end
