if @res.include?(:id)#question.idを持つかの判定
  #持っていれば@res内に格納したstatus,idを返す
  json.extract! @res, :status, :id
else
  #持っていなければ@res内に格納したstatusを返す
  json.extract! @res, :status
end
