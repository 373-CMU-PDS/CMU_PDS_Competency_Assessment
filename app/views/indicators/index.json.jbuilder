json.array!(@indicators) do |indicator|
  json.extract! indicator, :id, :competency_id, :level, :description
  json.url indicator_url(indicator, format: :json)
end
