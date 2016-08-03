class NarukosController < ApplicationController
  def create
    ids = User.where("id != ?", create_params[:user_id]).pluck(:registration_id)
    logger.debug(ids)
    registration_ids = ids
    options = {data: {message: "naruko", count: create_params[:count]}, collapse_key: "updated_score"}
    #稼働期間以外は停止
    #response = $gcm.send(registration_ids, options)
  end

  private
  def create_params
    params.permit(:user_id, :place_id, :count)
  end
end
