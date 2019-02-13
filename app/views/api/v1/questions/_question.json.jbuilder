json.(question, :id, :description, :created_at, :updated_at)
json.options do |json|
  json.array!(question.options) do |option|
    json.partial! 'api/v1/options/option', option: option
  end
end