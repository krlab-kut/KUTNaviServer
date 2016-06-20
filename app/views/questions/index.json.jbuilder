unless @questions.include?(:status)#エラーステータスを持っているかの判定
  json.set! "questions" do
    json.array!(@questions) do |question|
      json.extract! question, :id, :user_id, :title, :content
    end
  end
  json.set! "deleted_questions" do
    json.array!(@deleted_questions_ids)
  end
  json.extract! @user, :user_id
  json.extract! @time, :timestamp
else#異常ならstatusを返す
  json.extract! @questions, :status
end
