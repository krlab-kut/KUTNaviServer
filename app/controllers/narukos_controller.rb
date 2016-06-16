class NarukosController < ApplicationController
  skip_before_filter :verify_authenticity_token
=begin
  def GCMpush(ids)
    registration_ids = ids#User.find(4).registration_id#create_params[:user_id]
    options = {data: {message: "naruko"}, collapse_key: "updated_score"}
    $gcm.send(registration_ids, options)
  end
=end

  def create
=begin
    user_id = check_user_id(:params[:user_id])
    @user = User.find(user_id)
=end
    # naruko情報の登録
    ids = User.where("place_id != ?", create_params[:user_id]).pluck(:registration_id)
    logger.debug(ids)
    registration_ids = ids
    options = {data: {message: "naruko"}, collapse_key: "updated_score"}
    response = $gcm.send(registration_ids, options)
    #GCMpush(@user)
    #@res = { status: "200 OK" }
  end

  private
  def create_params
    params.permit(:user_id, :place_id)
  end

end
