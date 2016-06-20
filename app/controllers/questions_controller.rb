class QuestionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    #そもそもuser_idとlatest_atが無い、受け取れていない場合の判定
    unless index_params.has_key?(:user_id) && index_params.has_key?(:latest_at)
      @questions = {status: "400 Bad_Request"}
      return
    end
    #受け取ったuser_idがデータベースに存在しない場合の判定
    unless User.exists?(id: index_params[:user_id])
      @questions = {status: "404 Not_found"}
      return
    end
    #削除されたIDを受け取る
    id_of_deleted_question = DeletedQuestion.select(:question_id)
    #削除されていないデータを受け取る
    @questions = Question.where("id NOT IN(?) and updated_at > ? ", id_of_deleted_question, index_params[:latest_at])
    #削除された問題を受け取る
    @deleted_questions_ids = DeletedQuestion.where("updated_at > ?", index_params[:latest_at]).pluck(:id)
    #入力されたデータを受け取る
    @user = {user_id: index_params[:user_id]}
    @time = {timestamp: index_params[:latest_at]}
  end

  def create
    #そもそもuser_idとlatest_atが無い、受け取れていない場合の判定
    logger.debug(create_params[:question])
    unless create_params.has_key?(:user_id) && create_params[:question].has_key?(:title) && create_params[:question].has_key?(:content)
      logger.debug("400")
      @res = {status: "400 Bad_Request"}
      return
    end
    #受け取ったuser_idがデータベースに存在しない場合の判定
    unless User.exists?(id: create_params[:user_id])
      @res = {status: "404 Not_found"}
      return
    end
    #questionに:user_idと:contentを渡して新しいインスタンス作成
    @question = Question.new(create_params[:question])
    #データをそれぞれ入力
    @question.user_id = create_params[:user_id]
    #最後に保存
    if @question.save
      @res = {status: "200 OK", id: create_params[:user_id]}
    else
      @res = {status: "400 Bad_Request"}
    end
  end

  def delete
    #そもそもuser_idとlatest_atが無い、受け取れていない場合の判定
    unless delete_params.has_key?(:user_id) && delete_params.has_key?(:id)
      @res = {status: "400 Bad_Request"}
      return
    end
    #受け取ったuser_idがデータベースに存在しない場合の判定
    unless User.exists?(id: delete_params[:user_id]) && Question.exists?(id: delete_params[:id])
      @res = {status: "404 Not_found"}
      return
    end
    #指定されたidを持つレコードを消す
    Question.destroy_all(id: delete_params[:id])
    #削除されたid用の新しいレコードを作る
    @deleted = DeletedQuestion.new
    #削除するidを追加
    @deleted.question_id = delete_params[:id]
    #新しいレコードを保存
    if @deleted.save
      @res = {status: "200 OK"}
    else
      @res = {status: "400 Bad_Request"}
    end
  end

  private
  def index_params
    params.permit(:user_id, :latest_at)
  end
  def create_params
    params.permit(:user_id, question: [:title, :content])
  end
  def delete_params
    params.permit(:user_id, :id)
  end
end
