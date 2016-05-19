json.set! "MyQ&A" do
  json.set! :id, @question.id
  json.set! :uuid, @uuid
  json.set! :uid, @question.content
  json.set! :deleted, @question.deleted
  json.set! :children,
end
