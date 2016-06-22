unless @information.include?(:status)#エラーステータスを持っているかの判定
  json.set! "information" do
    json.array!(@information) do |info|
      #@information内に格納したデータをjson形式で表示する
      json.extract! info, :id, :content
    end
  end
  json.extract! @nowServerTime, :timestamp
else#異常ならstatusを返す
  json.extract! @information, :status
end
