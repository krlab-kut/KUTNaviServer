#json.array!で[]を呼び出す
json.array!(@events) do |info|
  #json.extrat!でデータベース内のデータを表示する
  json.extract! info, :title, :content, :place, :start_at
end
