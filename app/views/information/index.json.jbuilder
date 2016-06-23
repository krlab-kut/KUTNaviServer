unless defined?(@res)
  json.set! "information" do
    json.array!(@information) do |info|
      #@information内に格納したデータをjson形式で表示する
      json.extract! info, :id, :content
    end
  end
  #@nowServerTime内に格納したサーバの現在の時刻をjson形式で表示する
  json.extract! @nowServerTime, :timestamp
else#異常ならstatusを返す
  json.extract! @res, :status
end
