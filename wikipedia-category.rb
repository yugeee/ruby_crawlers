# coding: utf-8
require 'open-uri'
require 'nokogiri'
require 'uri'

@base_url = "https://ja.wikipedia.org"

category_url = '/wiki/Category:%E3%83%80%E3%83%B3%E3%82%B9%E3%83%BB%E3%83%9F%E3%83%A5%E3%83%BC%E3%82%B8%E3%83%83%E3%82%AF'
def category_search(url, depth)
  return if depth >= 4
  doc = Nokogiri::HTML(open(URI.escape(@base_url+url)))
  puts doc
  doc.xpath("//div[@class='CategoryTreeItem']/a").each do |element|
    puts element.text
    puts element[:href]
    category_search(element[:href], depth+1)
  end
end

category_search(category_url, 1)
