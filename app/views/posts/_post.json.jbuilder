json.extract! post, :id, :user_id, :team_id, :title, :contents, :created_at, :updated_at
json.url post_url(post, format: :json)
