@pages.each do |page|
  json.extract! page, :id, :url, :content
end
