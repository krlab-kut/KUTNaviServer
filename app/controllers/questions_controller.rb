class QuestionsController < ApplicationController

def index
  #uuidを元にUserのdbからデータを取り出し代入
  user = User.where(uuid)
  #idを元にQuestionのdbからデータを取り出し代入
  @question = Question.find(user.id)
  @uuid = uuid
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
