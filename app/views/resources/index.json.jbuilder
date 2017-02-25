json.array!(@resources) do |resource|
  json.extract! resource, :id, :type, :description, :link
  json.url resource_url(resource, format: :json)
end
