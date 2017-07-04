json.extract! wnews_post, :id, :title, :article, :image, :created_at, :updated_at
json.url wnews_post_url(wnews_post, format: :json)
