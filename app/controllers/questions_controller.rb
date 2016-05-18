class QuestionsController < ApplicationController

def index
  #uuidを元にQuestionのdbからデータを取り出し代入
  @question = Question.find(uuid)
  @uuid = uuid
end

def created
end

def delete
  #uuidを元にQuestionのdbからデータを取り出し代入
  @question = Question.find(uuid)
end

end
