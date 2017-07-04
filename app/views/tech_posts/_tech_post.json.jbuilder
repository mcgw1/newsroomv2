json.extract! tech_post, :id, :title, :article, :image, :created_at, :updated_at
json.url tech_post_url(tech_post, format: :json)
