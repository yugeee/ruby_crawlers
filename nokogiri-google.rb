# coding: utf-8
require 'nokogiri'
require 'open-uri'
require 'uri'
require 'cgi'

escaped_url = URI.escape('https://www.google.co.jp/search?q=クローラ&oe=utf-8&hl=ja')
doc = Nokogiri::HTML(open(escaped_url))

puts doc.xpath("//*[@id='resultStats']/text()")

doc.xpath('//h3/a').each do |link|
  puts CGI.parse(link[:href])['adurl']
  puts link.content
end
