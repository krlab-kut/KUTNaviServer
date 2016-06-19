if @res.include?(:id)#usr_idを持つかの判定
  json.extract! @res, :status, :id
else
  json.extract! @res, :status
end
