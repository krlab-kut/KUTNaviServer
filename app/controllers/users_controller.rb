class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
=begin
    user_id = check_user_id(user_params[:user_id])
    @user = User.find(user_id)
=end
    user_id = show_params[:user_id]
    @res = $congestion_info
  end

  def create
    @user = User.new
    @user.registration_id = create_params[:registration_id]

    if @user.save
      @res = { user_id: @user.id }
    else
      @res = { status: "500 ServerError"}
    end
  end

  def update
=begin
    user_id = check_user_id(:params[:user_id])
    @user = User.find(user_id)
=end
    @user = User.find(update_params[:user_id])

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
      @res = { status: "200 OK"}
    else
      @res = {status: "400 Bad_Request"}
    end
  end

  def registration
    @user = User.find(registration_params[:user_id])

    if @user.update(registration_id: registration_params[:registration_id])
      @res = { status: "200 OK"}
    else
      @res = { status: "500 ServerError"}
    end
  end

  private
  def show_params
    params.permit(:place_id)
  end

  def create_params
    params.permit(:registration_id)
  end

  def update_params
    params.require(:user).permit(:user_id, :place_id)
  end

  def registration_params
    params.permit(:user_id, :registration_id)
  end
end
