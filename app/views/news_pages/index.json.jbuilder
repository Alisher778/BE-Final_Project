json.array!(@news_pages) do |news_page|
  json.extract! news_page, :id, :title, :content
  json.url news_page_url(news_page, format: :json)
end
