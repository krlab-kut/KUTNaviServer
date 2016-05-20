

#json.set!で{}を呼び出す {"MyQ&A" :
json.set! "MyQ&A" do
  #json.array!で[]を呼び出す [id : ID...
  json.array!(@my_parnt_questions) do |my_parnt_question|
    #json.extrat!でデータベース内のデータを表示する
    json.extrat! question, :id, :uid, :content, :deletde,
    #最新情報の子を代入 条件指定で子を絞る
    children_questions = Question.where("parent_id not ? and updated_at > ? and parent_id = ? ", null, params[:latest_at], my_parnt_questions.id)
    #"children":[... を
    json.children!(children_questions) do |childQuestions|
        json.extrat! question, :id, :uid, :content, :deletde,
    end
end
