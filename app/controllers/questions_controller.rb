class QuestionsController < ApplicationController
skip_before_filter :verify_authenticity_token

def index
  #timestampのデータを受け取り、それより大きい(新しい)データを格納
  @questions = Information.where("updated_at > ?",params[:latest_at] )
  #qusetionsに格納したデータをjsonとして出力
  render :json => @questions
end

def created
end

def delete
  #uuidを元にUserのdbからデータを取り出し代入
  user = User.where(uuid)
  #idを元にQuestionのdbからデータを取り出し代入
  @question = Question.find(user.id)
end

end
