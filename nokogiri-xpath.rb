# coding: utf-8
require 'nokogiri'
require 'open-uri'

url = 'http://www.hatena.ne.jp'

doc = Nokogiri::HTML(open(url))

puts doc.xpath('/html/head/title')
puts doc.xpath('//title')

puts doc.xpath("//ul[@id='servicelist']/li[3]")

puts doc.xpath("//h2[@class='title']")

puts doc.xpath("//*[@id='s-link-bookmark']/a/span/span[1]/span").text
