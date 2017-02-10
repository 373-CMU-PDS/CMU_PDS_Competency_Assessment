json.array!(@indicator_questions) do |indicator_question|
  json.extract! indicator_question, :id, :indicator_id, :question_id, :active
  json.url indicator_question_url(indicator_question, format: :json)
end
