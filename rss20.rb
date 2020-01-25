# coding: utf-8
require 'nokogiri'
require 'open-uri'

url = 'https://www.kuroneko-square.net/services/amazon/rest?api=ItemSearch&Keywords=%E3%83%89%E3%82%A5%E3%83%AB%E3%83%BC%E3%82%BA&SearchIndex=Books&MinimumPrice=&MaximumPrice=&format=rss2'
xml = open(url).read

doc = Nokogiri::XML(xml)

# items
items = doc.xpath('//rss/channel/item')

items.each {|item|
  puts item.xpath('title').text
}
