class NarukosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def GCMpush
    registration_ids = []
    options = {data: {naruko: true}, collapse_key: "updated_score"}
    $gcm.send(registration_ids, options)
  end

  def create
=begin
    user_id = check_user_id(:params[:user_id])
    @user = User.find(user_id)
=end
    # naruko情報の登録
    GCMpush()
    if true
      @res = { status: "200 OK" }
    else
      @res = {status: "400 Bad_Request"}
    end
  end

  private
  def create_params
    params.permit(:user_id, :place_id)
  end


end
