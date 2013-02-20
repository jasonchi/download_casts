class Page
  
  def self.get_page_items url,file

  	content = Nokogiri::HTML(Net::HTTP.get(URI.parse(url)))
  	items = content.css("div.full div.episode")
  	items.each do |item|
  		url = item.css("h2 a").attr("href").text + ".mp4"
  		file.puts(url+"\n")
  	end
  	next_page_url = content.css("div.pagination a.next_page")
  	if next_page_url.size!=0
  		return "http://railscasts.com" + next_page_url.attr("href")
  	else
  		return nil
  	end
  end

end
