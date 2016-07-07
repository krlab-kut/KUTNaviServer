class UsersController < ApplicationController
  def index
    #そもそもuser_idが無い、受け取れていない場合の判定
    unless index_params.has_key?(:user_id)
      @res = {status: "400 Bad_Request"}
      return
    end
    #受け取ったuser_idに対応するidを持つUserが存在しない場合の判定
    unless User.exists?(id: index_params[:user_id])
      @res = {status: "404 Not_found"}
      return
    end
    @res = []#混雑情報格納用
    $congestion_info.each do |info|#場所ごとに混雑度を判定
      #アプリ利用者の人数によって判定
      if info[:counter] <= 4 #4人以下なら混雑度:低
        count = 0
      elsif info[:counter] <= 8 #8人以下なら混雑度:中
        count = 1
      else #8人超えなら混雑度:高
        count = 2
      end
      #判定した混雑情報を配列に格納する
      @res << {place_id: info[:place_id], counter: count}
    end
  end

  def create
    unless create_params.has_key?(:user_id) || create_params.has_key?(:registration_id)
      @res = {status: "400 Bad_Request"}
      return
    end

    if create_params[:user_id] == nil
      @user = User.new
    else
      unless User.exists?(id: create_params[:user_id])
        @res = {status: "404 Not_found"}
        return
      end
      @user = User.find(create_params[:user_id])
    end

    @user.registration_id = create_params[:registration_id]

    if create_params[:user_id] == nil
      if @user.save
        @res = { user_id: @user.id }
      else
        @res = { status: "500 ServerError"}
      end
    else
      if @user.update
        @res = { user_id: @user.id }
      else
        @res = { status: "500 ServerError"}
      end
    end
  end

  def update
    #user_idとplace_idが受け取れているかどうかの判定
    unless update_params.has_key?(:user_id) && update_params.has_key?(:place_id)
      @res = {status: "400 Bad_Request"}
      return
    end
    #受け取ったquestion_idに対応するidを持つQuestionが存在しない場合の判定
    unless User.exists?(id: update_params[:user_id])
      @res = {status: "404 Not_found"}
      return
    end
    #受け取ったuser_idを持つユーザの情報を格納する
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
      @res = {status: "200 OK"}
    else
      @res = {status: "400 Bad_Request"}
    end
  end

  private
  def index_params
    params.permit(:user_id)
  end

  def create_params
    params.permit(:user_id, :registration_id)
  end

  def update_params
    params.permit(:user_id, :place_id)
  end
end
