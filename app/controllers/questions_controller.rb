class QuestionsController < ApplicationController
skip_before_filter :verify_authenticity_token

def index
  #最新情報の自分のIDを持つ親の代入
  @my_parnt_questions = Question.where("parent_id = ? and user_id = ? and updated_at > ?", null, params[:uuid], params[:latest_at])
  #最新情報の他人のIDの持つ親の代入
  @other_parnt_questions = Qusetion.where("parent_id = ? and user_id not ? and updated_ > ?", null, params[:uuid], params[:latest_at])
  #最新情報の子を代入
  @children_questions = Question.where("parent_id not ? and updated_at > ?", null, params[:latest_at])
end

def created
  #questionsに新しいインスタンス作成
  @questions = Qusetion.new
  #データをそれぞれ入力
  @questions.user_id = params[:uuid]
  @questions.parent_id = params[:parent_id]
  @questions.content = params[:content]
  #最後に保存を実行
  @questions.save
end

def delete
  #質問情報IDを元に削除する質問を絞り込む
  @questions = Qusetion.where("id = ?", params[:id])
  #削除する質問が子を持っていた時子も削除する
  @children_questions = Qusetion.where("children = ?", params[:id])
  #deletedをtrueに
  @qusetions.deleted = true
  @children_questions.deletde = true
end

end
