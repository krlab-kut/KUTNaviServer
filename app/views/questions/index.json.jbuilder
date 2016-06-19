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
