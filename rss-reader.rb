require 'nokogiri'
require 'open-uri'

url = "https://www.kuroneko-square.net/services/amazon/rest?Keywords=%E6%9C%AC&format=rss2"
url = 'https://www.kuroneko-square.net/services/amazon/rest?api=ItemSearch&Keywords=%E3%83%89%E3%82%A5%E3%83%AB%E3%83%BC%E3%82%BA&SearchIndex=Books&MinimumPrice=&MaximumPrice=&format=rss2'
xml = Nokogiri::XML(open(url).read)

puts xml.xpath('/rss/channel/title').text

item_nodes = xml.xpath('//item')

item_nodes.each do |item|

  puts '==================='
  
  puts item.xpath('title').text

  puts item.xpath('link').text.match(%r{ASIN=(.+)})[1]

end
