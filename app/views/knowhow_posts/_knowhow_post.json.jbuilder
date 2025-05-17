json.extract! knowhow_post, :id, :title, :content, :user_id, :created_at, :updated_at
json.url knowhow_post_url(knowhow_post, format: :json)
