class NarukosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def time_search(dataTime, nowTime)
    return true if dataTime > nowTime - 60
    return false
  end

  def index
=begin
    user_id = check_uuid(:params[:uuid])
    @user = User.find(user_id)
=end
    @user = User.find(params[:user_id])
    @bool = "false"
    @narukos = Naruko.all
    # 場所の特定
    @narukos.each do |naruko|
      if params[:place_id].to_i() == naruko[:place_id] then
        @bool = "true"
        break
      end
    end
    # 時間の特定
    @narukos.each do |naruko|
      if (time_search(naruko[:created_at], Time.now))
        @bool = "true"
        break
      end
    end

    render 'narukos/index'
  end

  def create
=begin
    user_id = check_uuid(:params[:uuid])
    @user = User.find(user_id)
=end
    # naruko情報の登録
    @user = User.find(params[:user_id])
    @naruko = Naruko.create(place_id: params[:place_id])
    @hogehoge = { status: "200 OK" }
    render 'narukos/create'
  end
end
