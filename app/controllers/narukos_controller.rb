class NarukosController < ApplicationController
=begin
  def GCMpush(ids)
    registration_ids = ids#User.find(4).registration_id#create_params[:user_id]
    options = {data: {message: "naruko"}, collapse_key: "updated_score"}
    $gcm.send(registration_ids, options)
  end
=end

  def create
    ids = User.where("id != ?", create_params[:user_id]).pluck(:registration_id)
    logger.debug(ids)
    registration_ids = ids
    options = {data: {message: "naruko"}, collapse_key: "updated_score"}
    response = $gcm.send(registration_ids, options)
    # GCMとクライアント側両方になげたい
    #GCMpush(@user)
    #@res = { status: "200 OK" }
  end

  private
  def create_params
    params.permit(:user_id, :place_id)
  end

end
