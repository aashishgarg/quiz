json.(question_attempt, :id, :question_id, :option_id, :user_id)
json.answer_id question_attempt.answer.id
json.score question_attempt.score
json.total_score User.current.score
json.created_at question_attempt.created_at
json.updated_at question_attempt.updated_at
