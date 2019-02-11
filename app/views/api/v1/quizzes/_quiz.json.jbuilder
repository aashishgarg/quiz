json.(quiz, :id, :name, :created_at, :updated_at)
json.questions do
  json.array!(quiz.questions) do |question|
    json.partial! 'api/v1/questions/question', question: question
  end
end
