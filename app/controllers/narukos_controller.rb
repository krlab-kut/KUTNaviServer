class NarukosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def GCMpush(ids)
    registration_ids = ids#User.find(4).registration_id#create_params[:user_id]
    options = {data: {message: "naruko"}, collapse_key: "updated_score"}
    $gcm.send(registration_ids, options)
  end

  def create
=begin
    user_id = check_user_id(:params[:user_id])
    @user = User.find(user_id)
=end
    # naruko情報の登録
    @user = User.where("place_id != ? and place_id = ?", create_params[:user_id], create_params[:place_id]).pluck(:id)
    GCMpush(@user)
    @res = { status: "200 OK" }
  end

  private
  def create_params
    params.permit(:user_id, :place_id)
  end

end
