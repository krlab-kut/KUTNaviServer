if @res.has_key?(:user_id)
  json.extract! @res, :user_id
else
  json.extract! @res, :status
end
