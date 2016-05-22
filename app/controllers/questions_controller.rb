class QuestionsController < ApplicationController
skip_before_filter :verify_authenticity_token

def index
  #子のparent_idより出力すべき親idを求める parnt_id=親idを格納する配列
  parnt_id = Question.where("parent_id IS NOT NULL and updated_at > ? " , params[:latest_at]).pluck(:parent_id)
  #配列内の重複をなくす
  parnt_id.uniq!

  #自分のIDを持つ最新情報の親と最新情報の子を持つ親を入れる
  @my_questions = Question.where("user_id = ? and ( updated_at > ? and parent_id = ? or id IN (?) )", params[:uuid], params[:latest_at], nil, parnt_id)

  #他人のIDを持つ最新情報の親と最新情報の子を持つ親を入れる
  @other_questions = Question.where(" updated_at > ? and parent_id = ? or id IN (?)", params[:latest_at], nil, parnt_id)
  @other_questions = @other_questions.where.not("user_id = ?", params[:uuid])
end

def create
  #questionsに新しいインスタンス作成
  questions = Question.new
  #データをそれぞれ入力
  questions.user_id = params[:uuid]
  questions.parent_id = params[:parent_id]
  questions.content = params[:content]
  questions.deleted = 0
  #最後に保存を実行
  questions.save
end

def delete
  #質問情報IDを元に削除する質問を絞り込む
  questions = Question.where("id = ?", params[:id])
  #削除する質問が子を持っていた時子も削除する
  #children_questions = Question.where("children = ?", params[:id])
  #deletedをtrueに
  questions.deleted = true
  #children_questions.deleted = true
  #questions.update(deleted = true)
  #children_questions.update(deleted = true)
  #最後に保存を実行
  #questions.save
  #children_questions.save
end

end
