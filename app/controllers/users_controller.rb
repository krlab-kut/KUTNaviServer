class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
=begin
    user_id = check_uuid(user_params[:uuid])
    @user = User.find(user_id)
=end
    #そもそもuser_idが無い、受け取れていない場合の判定
    unless show_params.has_key?(:user_id)
      @res = {"status": "400 Bad_Request"}
      return
    end
    #受け取ったuser_idがデータベースに存在しない場合の判定
    unless User.exists?(id: show_params[:user_id])
      @res = {status: "404 Not_found"}
      return
    end
    #ユーザIDの存在を確認したら混雑情報を渡す
    @res = $congestion_info#プロトタイプでは適当な数値
  end

  def update
=begin
    user_id = check_uuid(:params[:uuid])
    @user = User.find(user_id)
=end
    @user = User.find(update_params[:uuid])

    # 前にいた場所の混雑情報カウンタの値を1引く
    $congestion_info.each do |info|
      info[:counter] -= 1 if @user.place_id == info[:place_id]
      info[:counter] = 0 if info[:counter] < 0
    end

    # 今いる場所の混雑情報カウンタの値を加算する
    $congestion_info.each do |info|
      info[:counter] += 1 if update_params[:place_id] == info[:place_id]
    end

    # user情報の更新
    if @user.update(place_id: update_params[:place_id])
      @res = {status: "200 OK"}
    else
      @res = {status: "400 Bad_Request"}
    end
  end

  private
def show_params
  #user_idを返す
  params.permit(:user_id)
end
  def update_params
    #userモデルのuuidとplaceを渡す
    params.require(:user).permit(:uuid, :place_id)
  end
end
