
#json.set!で{}を呼び出す
json.set! do
  #json.array!で[]を呼び出す
  json.array!(@informations) do |information|
    #json.extrat!でデータベース内のデータを表示する
    json.extrat! information, :title, :content, :place, :start_at
  end
end
