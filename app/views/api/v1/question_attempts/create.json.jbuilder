json.result do |json|
  json.partial! 'question_attempt', question_attempt: @question_attempt
end
