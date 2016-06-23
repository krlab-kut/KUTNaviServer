unless @res.include?(:status)#エラーステータスを持っているかの判定
  json.array!(@res) do |r|#正常ならplace_id counterを返す
    json.extract! r, :place_id, :counter
  end
else#異常ならstatusを返す
    json.extract! @res, :status
end
