#子を持つ親の代入
@questions_parnt = Question.where("")

#json.set!で{}を呼び出す {"MyQ&A" :
json.set! "MyQ&A" do
  #json.array!で[]を呼び出す [id : ID...
  json.array!(@questions) do |question|
    #json.extrat!でデータベース内のデータを表示する
    json.extrat! question, :id, :uid, :content, :deletde,
    #"children":[... を
    json.children!
end
