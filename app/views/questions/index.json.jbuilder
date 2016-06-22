unless @questions.include?(:status)#エラーステータスを持っているかの判定
  json.set! "questions" do
    json.array!(@questions) do |question|
      #@question内に格納したデータをjson形式で表示する
      json.extract! question, :id, :user_id, :title, :content
    end
  end
  json.set! "deleted_questions" do
    #@deleted_questions_ids内に格納したデータをjson形式で表示する
    json.array!(@deleted_questions_ids)
  end
  json.extract! @user_id, :user_id
  json.extract! @nowServerTime, :timestamp
else#異常ならstatusを返す
  json.extract! @questions, :status
end
