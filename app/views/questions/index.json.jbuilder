
#json.set!で{}を呼び出す {"MyQ&A" :
json.set! "MyQ_A" do
  #json.array!で[]を呼び出す [id : ID...
  json.array!  (@my_questions) do |question|
    #json.extrat!でデータベース内のデータを表示する
    json.extract! question, :id, :user_id, :content, :deleted
    #最新情報の子を代入 条件指定で子を絞る
    children_questions = Question.where("parent_id IS NOT NULL and updated_at > ? and parent_id = ? ", params[:latest_at], question.id)
    #"children":[... を
    json.children(children_questions) do |childQuestions|
        json.extract! childQuestions, :id, :user_id, :content, :deleted
        end
    end
end

#json.set!で{}を呼び出す {"OtherQ&A" :
json.set! "OtherQ_A" do
  #json.array!で[]を呼び出す [id : ID...
  json.array!(@other_questions) do |question|
    #json.extrat!でデータベース内のデータを表示する
    json.extract! question, :id, :user_id, :content, :deleted

    #最新情報の子を代入 条件指定で子を絞る
    children_questions = Question.where("parent_id IS NOT NULL and updated_at > ? and parent_id = ? ", params[:latest_at], question.id)
    #"children":[... を
    json.children(children_questions) do |childQuestions|
        json.extract! childQuestions, :id, :user_id, :content, :deleted
      end
    end
end
