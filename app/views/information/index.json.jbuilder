unless @information.include?(:status)#エラーステータスを持っているかの判定
  #json.array!で[]を呼び出す
  json.set! "information" do
    json.array!(@information) do |info|
      #json.extrat!でデータベース内のデータを表示する
      json.extract! info, :title, :content, :place, :start_at
    end
  end
else#異常ならstatusを返す
  json.extract! @information, :status
end
