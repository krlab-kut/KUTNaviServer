class AnswersController < ApplicationController
  def index
    #そもそもuser_idとquestion_idが無い、受け取れていない場合の判定
    unless index_params.has_key?(:user_id) && index_params.has_key?(:question_id)
      @answers = {status: "400 Bad_Request"}
      return
    end
    #受け取ったuser_idに対応するidを持つUserが存在しない場合の判定
    #受け取ったquestion_idに対応するidを持つQuestionが存在しない場合の判定
    unless User.exists?(id: index_params[:user_id]) && Question.exists?(id: index_params[:question_id])
      @answers = {status: "404 Not_found"}
      return
    end
    #受け取ったquestion_idを持つ回答を格納する
    @answers = Answer.where("question_id = ?", index_params[:question_id])
  end

  private
  def index_params
      params.permit(:user_id, :question_id)
  end
end
