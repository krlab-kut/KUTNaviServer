class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def update
    # user_id = check_uuid(:params[:uuid])
    # @user = User.find(user_id)
    @user = User.find(params[:user_id])
    @user.update(place_id: params[:place_id])
    @hoge = { status: "200 OK" }
    render :json => @hoge
  end

  def show
    # check_uuid()
  end
end
