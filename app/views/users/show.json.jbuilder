json.array!(@res) do |r|
  json.extract! r, :place_id, :counter
end
