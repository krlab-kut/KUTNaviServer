class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def update
=begin
    user_id = check_uuid(:params[:uuid])
    @user = User.find(user_id)
=end
    @user = User.find(params[:user_id])
    # 前にいた場所の混雑情報カウンタの値を1引く
    $test_info.each do |info|
      info[:test_counter] -= 1 if @user.place_id == info[:place_id]
    end
    # 今いる場所の混雑情報カウンタの値を加算する
    $test_info.each do |info|
      info[:test_counter] += 1 if params[:place_id] == info[:place_id]
    end
    # user情報の更新
    @user.update(place_id: params[:place_id])

    @hoge = { status: "200 OK", foo: "bar"}
    # render :json => @hoge
    render 'users/update'
  end

  def show
    render 'users/show'
=begin
    user_id = check_uuid(:params[:uuid])
    @user = User.find(user_id)
=end
    @user = User.find(params[:user_id])
  end
end
