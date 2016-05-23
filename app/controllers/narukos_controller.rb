class NarukosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def time_search(dataTime, nowTime)
    # ["2016-05-23 03:19:24 +0000", "2016-05-23 03:19:24 +0000"]
    # ["2016-05-21 19:42:46 UTC", "2016-05-21 19:44:18 UTC"]
    # dtimearray = dataTime.split(" ")
    # ntimearray = nowTime.split(" ")
    # dtime = dtimearray[1].split(":")
    # ntime = ntimearray[1].split(":")
    # return true if dtime[1].to_i() > ntime[1].to_i() - 1
    return true if dataTime > nowTime - 60
    return false
  end

  def index
=begin
    user_id = check_uuid(:params[:uuid])
    @user = User.find(user_id)
=end

    # Time.now
    # -----
    # 2016-05-21T20:35:50.358+00:00
    #
    # created_at
    # ----------
    # 2016-05-21T20:37:02.739Z

    @user = User.find(params[:user_id])
    @bool = "false"
    @narukos = Naruko.all
    # @narukos.each do |naruko|
    #   if params[:place_id].to_i() == naruko[:place_id] then
    #     @bool = "true"
    #     break
    #   end
    # end

    # @naruko = Naruko.where(created_at: [1.days.ago...Time.now])
    # @naruko = Naruko.find_by(place_id: 100)
    # @test = []
    # nowTime = Time.now.to_s()
    @narukos.each do |naruko|
      # dataTime = naruko[:created_at].to_s()
      # if (time_search(dataTime, nowTime)) then
      if (time_search(naruko[:created_at], Time.now))
        @bool = "true"
        break
      end
      # @test << naruko[:created_at].to_s()
      # @test << Time.now.to_s()
    end

    render 'narukos/index'
  end

  def create
=begin
    user_id = check_uuid(:params[:uuid])
    @user = User.find(user_id)
=end
    @user = User.find(params[:user_id])
    @naruko = Naruko.create(place_id: params[:place_id])
    @hogehoge = { status: "200 OK" }
    render 'narukos/create'
  end
end
