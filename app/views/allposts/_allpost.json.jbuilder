json.extract! allpost, :id, :title, :article, :image, :created_at, :updated_at
json.url allpost_url(allpost, format: :json)
