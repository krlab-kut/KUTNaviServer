unless @my_questions.include?(:status)#エラーステータスを持っているかの判定
  json.set! "my_questions" do
    json.array!(@my_questions) do |question|
      json.extract! question, :id, :user_id, :title, :content
    end
  end
  json.set! "other_questions" do
    json.array!(@other_questions) do |question|
      json.extract! question, :id, :user_id, :title, :content
    end
  end
  json.set! "deleted_questions" do
    json.array!(@deleted_questions_ids) do |question|
      json.extract! question, :id
    end
  end
  json.extract! @user, :user_id
  json.extract! @time, :timestamp
else#異常ならstatusを返す
  json.extract! @my_questions, :status
end

=begin
#json.set!で{}を呼び出す {"MyQ&A" :
json.set! "MyQ_A" do
  #json.array!で[]を呼び出す [id : ID...
  json.array!(@my_parent_questions) do |question|
    #json.extrat!でデータベース内のデータを表示する
    json.extract! question, :id, :user_id, :content, :deleted
    #最新情報の子を代入 条件指定で子を絞る
    children_questions = Question.where("parent_id = ? ", question.id)
    #"children":[... を
    json.children(children_questions) do |childQuestion|
      json.extract! childQuestion, :id, :user_id, :content, :deleted
    end
  end
end

#json.set!で{}を呼び出す {"OtherQ&A" :
json.set! "OtherQ_A" do
  #json.array!で[]を呼び出す [id : ID...
  json.array!(@other_parent_questions) do |question|
    #json.extrat!でデータベース内のデータを表示する
    json.extract! question, :id, :user_id, :content, :deleted
    #最新情報の子を代入 条件指定で子を絞る
    children_questions = Question.where("parent_id = ? ", question.id)
    #"children":[... を
    json.children(children_questions) do |childQuestion|
        json.extract! childQuestion, :id, :user_id, :content, :deleted
    end
  end
end
=end
