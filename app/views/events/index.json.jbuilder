unless defined?(@res)
  json.set! "events" do
    json.array!(@events) do |event|
      #@events内に格納したデータをjson形式で表示する
      json.extract! event, :id, :title, :content, :place, :start_at, :end_at
    end
  end
  #@nowServerTime内に格納したサーバの現在の時刻をjson形式で表示する
  json.extract! @nowServerTime, :timestamp
else#異常ならstatusを返す
  json.extract! @res, :status
end
