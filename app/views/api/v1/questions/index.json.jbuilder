json.questions do |json|
  json.array!(@questions) do |question|
    json.partial! 'question', question: @question
  end
end
