unless defined?(@res)
  json.set! "questions" do
    json.array!(@questions) do |question|
      #@question内に格納したデータをjson形式で表示する
      json.extract! question, :id, :user_id, :title, :content
    end
  end
  json.set! "deleted_question_ids" do
    #@deleted_questions_ids内に格納したデータをjson形式で表示する
    json.array!(@deleted_question_ids)
  end
  #@user_id内に格納したuser_idを出力する
  json.extract! @user_id, :user_id
  #@nowServerTime内に格納したサーバの現在の時刻をjson形式で表示する
  json.extract! @nowServerTime, :timestamp
else#異常ならstatusを返す
  json.extract! @res, :status
end
