json.(quizset, :id, :created_at, :updated_at)
json.quizzes do |json|
  json.array!(quizset.quizzes) do |quiz|
    json.partial! 'api/v1/quizzes/quiz', quiz: quiz
  end
end