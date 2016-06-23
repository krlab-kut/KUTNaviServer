unless defined?(@res)
  json.set! "answers" do
    json.array!(@answers) do |answer|
      #@answers内に格納したデータをjson形式で表示する
      json.extract! answer, :id, :content
    end
  end
else#異常ならstatusを返す
  json.extract! @res, :status
end
