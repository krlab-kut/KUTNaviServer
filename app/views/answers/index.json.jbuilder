unless @answer.include?(:status)#エラーステータスを持っているかの判定
  #json.array!で[]を呼び出す
  json.set! "answers" do
    json.array!(@answer) do |info|
      #json.extrat!でデータベース内のデータを表示する
      json.extract! info, :id, :content
    end
  end
  json.extract! @time, :timestamp
else#異常ならstatusを返す
  json.extract! @answer, :status
end
