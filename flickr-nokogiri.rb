# coding: utf-8
require 'open-uri'
require 'nokogiri'
require 'uri'
require 'cgi'

def save_image(url)
  filename = File.basename(url)
  open("file/#{filename.to_s}", 'wb') do |file|
    open(url) do |data|
      file.write(data.read)
    end
  end
end

search_word = URI.encode("cat")
doc = Nokogiri::HTML(open("https://www.flickr.com/search/?q=#{search_word }"))
doc.xpath("//div[@class='view photo-list-view requiredToShowOnServer']").each {|link|
  url = link.xpath("./div")
  puts url["style"]
  save_image(url)

  url = url.gsub('.jpg', '_b.jpg')
  pp url
  save_image(url)
}
