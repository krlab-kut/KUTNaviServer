unless @events.include?(:status)#エラーステータスを持っているかの判定
  #json.array!で[]を呼び出す
  json.set! "events" do
    #json.array!で[]を呼び出す
    json.array!(@events) do |info|
      #json.extrat!でデータベース内のデータを表示する
      json.extract! info, :id, :title, :content, :place, :start_at
    end
  end
  json.extract! @time, :timestamp
else#異常ならstatusを返す
  json.extract! @events, :status
end
