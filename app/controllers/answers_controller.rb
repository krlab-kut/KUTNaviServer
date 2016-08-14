class AnswersController < ApplicationController
  def index
    #リクエストに必要なパラメータが含まれているか確認
    unless index_params.has_key?(:user_id) && index_params.has_key?(:question_id)
      @res = {status: "400 Bad_Request"}
      return
    end

    #リクエストのパラメータで指定されたレコードが存在するか確認
    unless User.exists?(id: index_params[:user_id])
      @res = {status: "400 Bad_Request"}
      return
    end
    unless Question.exists?(id: index_params[:question_id])
      @res = {status: "404 Not_found"}
      return
    end
    
    @answers = Answer.where("question_id = ?", index_params[:question_id])
    @nowServerTime = {timestamp: Time.now.strftime("%Y-%m-%d %H:%M:%S")}
  end

  private
  def index_params
      params.permit(:user_id, :question_id)
  end
end
