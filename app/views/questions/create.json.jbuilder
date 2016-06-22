if @res.include?(:id)#question.idを持つかの判定
  json.extract! @res, :status, :id
else
  json.extract! @res, :status
end
