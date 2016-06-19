class AnswersController < ApplicationController

  def index
    #そもそもuser_idとlatest_atが無い、受け取れていない場合の判定
    unless index_params.has_key?(:user_id)# && index_params.has_key?(:question_id) && index_params.has_key?(:latest_at)
      @answer = {status: "400 Bad_Request"}
      return
    end
    #受け取ったuser_idがデータベースに存在しない場合の判定
    unless User.exists?(id: index_params[:user_id]) && Question.exists?(id: index_params[:question_id])
      @answer = {status: "404 Not_found"}
      return
    end
    @answer = Answer.where("question_id = ?", index_params[:question_id])
    @time = {timestamp: index_params[:latest_at]}
  end

  private
  def index_params
      params.permit(:user_id, :question_id, :latest_at)
  end

end
