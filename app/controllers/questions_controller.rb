class QuestionsController < ApplicationController
  def index
    #リクエストに必要なパラメータが含まれているか確認
    unless index_params.has_key?(:user_id) && index_params.has_key?(:latest_at)
      @res = {status: "400 Bad_Request"}
      return
    end

    #リクエストのパラメータで指定されたレコードが存在するか確認
    unless User.exists?(id: index_params[:user_id])
      @res = {status: "404 Not_found"}
      return
    end

    unless index_params[:latest_at] == nil
      @questions = Question.where("updated_at > ? ", index_params[:latest_at])
    else
      @questions = Question.All
    end
    @deleted_questions = DeletedQuestion.where("updated_at > ?", index_params[:latest_at]).pluck(:question_id)
    @user_id = {user_id: index_params[:user_id]}
    @nowServerTime = {timestamp: Time.now.strftime("%Y-%m-%d %H:%M:%S")}
  end

  def create
    #リクエストに必要なパラメータが含まれているか確認
    unless create_params.has_key?(:user_id) && create_params[:question].has_key?(:title) && create_params[:question].has_key?(:content)
      @res = {status: "400 Bad_Request"}
      return
    end

    #リクエストのパラメータで指定されたレコードが存在するか確認
    unless User.exists?(id: create_params[:user_id])
      @res = {status: "404 Not_found"}
      return
    end

    @question = Question.new(create_params[:question])
    @question.user_id = create_params[:user_id]

    if @question.save
      @res = {status: "200 OK", id: @question.id}
    else
      @res = {status: "400 Bad_Request"}
    end
  end

  def delete
    #リクエストに必要なパラメータが含まれているか確認
    unless delete_params.has_key?(:user_id) && delete_params.has_key?(:id)
      @res = {status: "400 Bad_Request"}
      return
    end

    #リクエストのパラメータで指定されたレコードが存在するか確認
    unless User.exists?(id: delete_params[:user_id]) && Question.exists?(id: delete_params[:id])
      @res = {status: "404 Not_found"}
      return
    end

    Question.destroy_all(id: delete_params[:id])
    @deleted = DeletedQuestion.new
    @deleted.question_id = delete_params[:id]
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
