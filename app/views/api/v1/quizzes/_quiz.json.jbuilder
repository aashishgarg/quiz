json.(quiz, :id, :created_at, :updated_at)
json.question do
  json.partial! 'api/v1/questions/question', question: quiz.question
end
