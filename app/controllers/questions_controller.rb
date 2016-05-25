class QuestionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    id_of_updated_children = Question.where("parent_id IS NOT NULL and updated_at < ?", time_params[:latest_at]).pluck(:parent_id)
    id_of_updated_children.uniq
    @my_parent_questions = Question.where("user_id = ? and parent_id IS NULL", 1)
    @other_parent_questions = Question.where("user_id != ? and parent_id IS NULL", 1)
    if(!id_of_updated_children.empty?)
      @my_parent_questions.where("updated_at > ? or IN(?)", time_params[:latest_at], id_of_updated_children)
    end
    if(!id_of_updated_children.empty?)
      @other_parent_questions.where("updated_at > ? or IN(?)", time_params[:latest_at], id_of_updated_children)
    end
  end

  def create
    #questionに新しいインスタンス作成
    @question = Question.new
    #データをそれぞれ入力
    @question.user_id = 1
    @question.parent_id = question_params[:parent_id]
    @question.content = question_params[:content]
    @question.deleted = 0
    #最後に保存
    if @question.save
      @res = {status: "200 OK"}
    else
      @res = {status: "400 Bad_Request"}
    end

  end

  def delete
    #質問情報IDを元に削除する質問を絞り込む
    questions = Question.where("id = ?", delete_params[:id])
    #削除する質問が子を持っていた時子も削除する
    children_questions = Question.where("parent_id = ?", delete_params[:id])
    #deletedをtrueに
    if questions.update_all("deleted = true") & children_questions.update_all("deleted = true")
      @res = {status: "200 OK"}
    else
      @res = {status: "400 Bad_Request"}
    end
  end

  private
  def uuid_params
    params.permit(:uuid)
  end

  def question_params
    params.require(:question).permit(:parent_id, :content)
  end

  def time_params
    params.permit(:latest_at)
  end

  def delete_params
    params.permit(:id)
  end
end
