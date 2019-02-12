json.(user, :id, :name, :email, :is_admin)
json.score user.score if user.score
json.created_at user.created_at
json.updated_at user.updated_at