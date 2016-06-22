unless @answers.include?(:status)#エラーステータスを持っているかの判定
  json.set! "answers" do
    json.array!(@answers) do |answer|
      json.extract! answer, :id, :content
    end
  end
else#異常ならstatusを返す
  json.extract! @answers, :status
end
