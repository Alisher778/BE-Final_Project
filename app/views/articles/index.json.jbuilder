json.array!(@articles) do |article|
  json.extract! article, :id, :title, :contant
  json.url article_url(article, format: :json)
end
