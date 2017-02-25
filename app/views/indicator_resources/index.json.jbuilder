json.array!(@indicator_resources) do |indicator_resource|
  json.extract! indicator_resource, :id, :indicator_id, :resource_id
  json.url indicator_resource_url(indicator_resource, format: :json)
end
