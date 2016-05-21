class NarukosController < ApplicationController
  skip_before_filter :verify_authenticity_token
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
    # @narukos = Naruko.all
    # @narukos.each do |naruko|
    #   if params[:place_id].to_i() == naruko[:place_id] then
    #     @bool = "true"
    #     break
    #   end
    # end
    @naruko = Naruko.where(created_at: [1.days.ago..Time.now])
    # @naruko = Naruko.find_by(place_id: 100)

    # @narukos.each do |naruko|
      # @test << naruko[:created_at]
      # @test << Time.now
      # @test <<
    # end

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
